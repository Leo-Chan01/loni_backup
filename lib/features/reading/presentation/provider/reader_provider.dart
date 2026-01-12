import 'dart:async';

import 'package:flutter/foundation.dart';

import 'package:loni_africa/features/discovery/data/services/discovery_api_service.dart';
import 'package:loni_africa/features/discovery/domain/models/book.dart';
import 'package:loni_africa/features/reading/data/services/reading_api_service.dart';
import 'package:loni_africa/features/reading/domain/utils/content_file_id_parser.dart';

class ReaderProvider extends ChangeNotifier {
  ReaderProvider({
    required this.bookId,
    DiscoveryApiService? discoveryApiService,
    ReadingApiService? readingApiService,
  }) : _discoveryApiService = discoveryApiService ?? DiscoveryApiService(),
       _readingApiService = readingApiService ?? ReadingApiService() {
    _load();
  }

  final String bookId;
  final DiscoveryApiService _discoveryApiService;
  final ReadingApiService _readingApiService;

  bool _isLoading = true;
  String? _error;
  Book? _book;
  List<String> _paragraphs = const [];
  double _progress = 0.0;

  Timer? _syncDebounce;

  bool get isLoading => _isLoading;
  String? get error => _error;
  Book? get book => _book;
  List<String> get paragraphs => _paragraphs;
  double get progress => _progress;

  Future<void> retry() => _load();

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
    super.dispose();
  }
}
