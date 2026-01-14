import '../models/reading_session_entry.dart';
import '../repository/reading_analytics_repository.dart';

class ListReadingSessionsUseCase {
  const ListReadingSessionsUseCase(this._repository);

  final ReadingAnalyticsRepository _repository;

  Future<List<ReadingSessionEntry>> call() {
    return _repository.listReadingSessions();
  }
}
