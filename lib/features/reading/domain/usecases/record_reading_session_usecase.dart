import '../repository/reading_analytics_repository.dart';

class RecordReadingSessionUseCase {
  const RecordReadingSessionUseCase(this._repository);

  final ReadingAnalyticsRepository _repository;

  Future<void> call({
    required String catalogItemId,
    required DateTime startedAt,
    required DateTime endedAt,
    int? durationSeconds,
    String? deviceId,
    Map<String, dynamic>? metadata,
  }) {
    return _repository.recordReadingSession(
      catalogItemId: catalogItemId,
      startedAt: startedAt,
      endedAt: endedAt,
      durationSeconds: durationSeconds,
      deviceId: deviceId,
      metadata: metadata,
    );
  }
}
