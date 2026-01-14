import '../models/highlight_entry.dart';
import '../repository/reading_analytics_repository.dart';

class ListHighlightsUseCase {
  const ListHighlightsUseCase(this._repository);

  final ReadingAnalyticsRepository _repository;

  Future<List<HighlightEntry>> call() {
    return _repository.listHighlights();
  }
}
