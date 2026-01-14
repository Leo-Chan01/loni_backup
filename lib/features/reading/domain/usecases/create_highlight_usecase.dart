import '../models/highlight_entry.dart';
import '../repository/reading_analytics_repository.dart';

class CreateHighlightUseCase {
  const CreateHighlightUseCase(this._repository);

  final ReadingAnalyticsRepository _repository;

  Future<HighlightEntry> call({
    required String catalogItemId,
    required String cfi,
    String? text,
    String? note,
    String? color,
  }) {
    return _repository.createHighlight(
      catalogItemId: catalogItemId,
      cfi: cfi,
      text: text,
      note: note,
      color: color,
    );
  }
}
