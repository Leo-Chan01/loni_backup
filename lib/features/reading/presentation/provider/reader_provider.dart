import 'dart:async';

import 'package:flutter/foundation.dart';

import 'package:loni_africa/features/discovery/data/services/discovery_api_service.dart';
import 'package:loni_africa/features/discovery/domain/models/book.dart';
import 'package:loni_africa/features/reading/data/repository/reading_analytics_repository_impl.dart';
import 'package:loni_africa/features/reading/data/services/reading_api_service.dart';
import 'package:loni_africa/features/reading/domain/models/reading_session_entry.dart';
import 'package:loni_africa/features/reading/domain/repository/reading_analytics_repository.dart';
import 'package:loni_africa/features/reading/domain/usecases/create_highlight_usecase.dart';
import 'package:loni_africa/features/reading/domain/usecases/list_reading_sessions_usecase.dart';
import 'package:loni_africa/features/reading/domain/usecases/record_reading_session_usecase.dart';
import 'package:loni_africa/features/reading/domain/utils/content_file_id_parser.dart';

class ReaderProvider extends ChangeNotifier {
  ReaderProvider({
    required this.bookId,
    DiscoveryApiService? discoveryApiService,
    ReadingApiService? readingApiService,
    ReadingAnalyticsRepository? analyticsRepository,
  }) : _discoveryApiService = discoveryApiService ?? DiscoveryApiService(),
       _readingApiService = readingApiService ?? ReadingApiService(),
       _analyticsRepository =
           analyticsRepository ?? ReadingAnalyticsRepositoryImpl() {
    _createHighlightUseCase = CreateHighlightUseCase(_analyticsRepository);
    _listReadingSessionsUseCase = ListReadingSessionsUseCase(
      _analyticsRepository,
    );
    _recordReadingSessionUseCase = RecordReadingSessionUseCase(
      _analyticsRepository,
    );
    _sessionStartedAt = DateTime.now().toUtc();
    _load();
  }

  final String bookId;
  final DiscoveryApiService _discoveryApiService;
  final ReadingApiService _readingApiService;
  final ReadingAnalyticsRepository _analyticsRepository;

  late final CreateHighlightUseCase _createHighlightUseCase;
  late final ListReadingSessionsUseCase _listReadingSessionsUseCase;
  late final RecordReadingSessionUseCase _recordReadingSessionUseCase;
  late final DateTime _sessionStartedAt;

  bool _isLoading = true;
  String? _error;
  Book? _book;
  List<String> _paragraphs = const [];
  double _progress = 0.0;

  bool _isReadingSessionsLoading = false;
  String? _readingSessionsError;
  List<ReadingSessionEntry> _readingSessions = const [];

  Timer? _syncDebounce;

  bool get isLoading => _isLoading;
  String? get error => _error;
  Book? get book => _book;
  List<String> get paragraphs => _paragraphs;
  double get progress => _progress;

  bool get isReadingSessionsLoading => _isReadingSessionsLoading;
  String? get readingSessionsError => _readingSessionsError;
  int get readingSessionsCount => _readingSessions.length;
  Duration get totalReadingDuration => Duration(
    seconds: _readingSessions.fold<int>(
      0,
      (total, session) => total + session.durationSeconds,
    ),
  );

  Future<void> retry() => _load();

  Future<void> createQuickHighlight() async {
    if (_paragraphs.isEmpty) return;

    final index = (_progress * (_paragraphs.length - 1)).round().clamp(
      0,
      _paragraphs.length - 1,
    );

    final raw = _paragraphs[index].trim();
    final snippet = raw.isEmpty
        ? null
        : (raw.length > 240 ? raw.substring(0, 240) : raw);

    await _createHighlightUseCase(
      catalogItemId: bookId,
      cfi: 'progress:${(_progress * 1000).round()}',
      text: snippet,
    );
  }

  void updateProgress(double value) {
    final clamped = value.clamp(0.0, 1.0);
    if (_progress == clamped) return;

    _progress = clamped;
    notifyListeners();

    _syncDebounce?.cancel();
    _syncDebounce = Timer(const Duration(seconds: 2), () async {
      try {
        await _readingApiService.syncReadingState(
          catalogItemId: bookId,
          cfi: 'progress:${(_progress * 1000).round()}',
          percentComplete: _progress,
          finished: _progress >= 0.999,
        );
      } catch (_) {
        // Intentionally ignore sync errors for now.
      }
    });
  }

  Future<void> _load() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    if (_readingSessions.isEmpty && !_isReadingSessionsLoading) {
      unawaited(_loadReadingSessions());
    }

    try {
      final book = await _discoveryApiService.getBookDetail(bookId);
      final fileId = ContentFileIdParser.resolve(book);
      if (fileId == null || fileId.isEmpty) {
        throw StateError('Missing fileId');
      }

      final sample = await _readingApiService.getSampleForBook(
        bookId: bookId,
        fileId: fileId,
        withPreviewToken: true,
      );

      _book = book;
      _paragraphs = _parseSampleToParagraphs(sample);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _loadReadingSessions() async {
    _isReadingSessionsLoading = true;
    _readingSessionsError = null;
    notifyListeners();

    try {
      final sessions = await _listReadingSessionsUseCase();
      _readingSessions =
          sessions
              .where((s) => s.catalogItemId == bookId)
              .toList(growable: false)
            ..sort((a, b) => b.startedAt.compareTo(a.startedAt));
      _isReadingSessionsLoading = false;
      notifyListeners();
    } catch (e) {
      _readingSessionsError = e.toString();
      _isReadingSessionsLoading = false;
      notifyListeners();
    }
  }

  List<String> _parseSampleToParagraphs(Map<String, dynamic> sample) {
    final content = sample['content'];
    if (content is List) {
      final paragraphs = content
          .whereType<String>()
          .map((p) => p.trim())
          .where((p) => p.isNotEmpty)
          .toList(growable: false);
      if (paragraphs.isNotEmpty) {
        return paragraphs;
      }
    }

    final text = sample['text'];
    if (text is String && text.trim().isNotEmpty) {
      return text
          .split(RegExp(r'\n\s*\n'))
          .map((p) => p.trim())
          .where((p) => p.isNotEmpty)
          .toList(growable: false);
    }

    final html = sample['html'];
    if (html is String && html.trim().isNotEmpty) {
      return [html.trim()];
    }

    return const [];
  }

  @override
  void dispose() {
    _syncDebounce?.cancel();

    final endedAt = DateTime.now().toUtc();
    final durationSeconds = endedAt.difference(_sessionStartedAt).inSeconds;
    if (durationSeconds >= 5) {
      unawaited(
        _recordReadingSessionUseCase(
          catalogItemId: bookId,
          startedAt: _sessionStartedAt,
          endedAt: endedAt,
          durationSeconds: durationSeconds,
          metadata: <String, dynamic>{'percentComplete': _progress},
        ).catchError((_) {}),
      );
    }

    super.dispose();
  }
}
