import '../models/highlight_entry.dart';
import '../models/reading_session_entry.dart';

abstract class ReadingAnalyticsRepository {
  Future<List<HighlightEntry>> listHighlights();

  Future<HighlightEntry> createHighlight({
    required String catalogItemId,
    required String cfi,
    String? text,
    String? note,
    String? color,
  });

  Future<void> recordReadingSession({
    required String catalogItemId,
    required DateTime startedAt,
    required DateTime endedAt,
    int? durationSeconds,
    String? deviceId,
    Map<String, dynamic>? metadata,
  });

  Future<List<ReadingSessionEntry>> listReadingSessions();
}
