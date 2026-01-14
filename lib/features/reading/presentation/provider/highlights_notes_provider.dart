import 'package:flutter/foundation.dart';

import 'package:loni_africa/features/reading/data/repository/reading_analytics_repository_impl.dart';
import 'package:loni_africa/features/reading/domain/models/highlight_entry.dart';
import 'package:loni_africa/features/reading/domain/repository/reading_analytics_repository.dart';
import 'package:loni_africa/features/reading/domain/usecases/create_highlight_usecase.dart';
import 'package:loni_africa/features/reading/domain/usecases/list_highlights_usecase.dart';

enum HighlightsFilter { all, highlights, notes }

class HighlightsNotesProvider extends ChangeNotifier {
  HighlightsNotesProvider({
    required this.bookId,
    ReadingAnalyticsRepository? repository,
  }) : _repository = repository ?? ReadingAnalyticsRepositoryImpl() {
    _listHighlightsUseCase = ListHighlightsUseCase(_repository);
    _createHighlightUseCase = CreateHighlightUseCase(_repository);
    _load();
  }

  final String bookId;
  final ReadingAnalyticsRepository _repository;

  late final ListHighlightsUseCase _listHighlightsUseCase;
  late final CreateHighlightUseCase _createHighlightUseCase;

  bool _isLoading = true;
  String? _error;
  List<HighlightEntry> _all = const [];
  HighlightsFilter _filter = HighlightsFilter.all;

  bool get isLoading => _isLoading;
  String? get error => _error;
  HighlightsFilter get filter => _filter;

  List<HighlightEntry> get items {
    final scoped = _all.where((h) => h.catalogItemId == bookId).toList();

    switch (_filter) {
      case HighlightsFilter.all:
        return scoped;
      case HighlightsFilter.highlights:
        return scoped.where((h) => !h.hasNote).toList();
      case HighlightsFilter.notes:
        return scoped.where((h) => h.hasNote).toList();
    }
  }

  int get totalCount => _all.where((h) => h.catalogItemId == bookId).length;

  Future<void> retry() => _load();

  void setFilter(HighlightsFilter filter) {
    if (_filter == filter) return;
    _filter = filter;
    notifyListeners();
  }

  Future<void> addQuickHighlight({
    required String cfi,
    String? text,
    String? note,
    String? color,
  }) async {
    await _createHighlightUseCase(
      catalogItemId: bookId,
      cfi: cfi,
      text: text,
      note: note,
      color: color,
    );

    await _load();
  }

  Future<void> _load() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _all = await _listHighlightsUseCase();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}
