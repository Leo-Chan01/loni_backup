import '../../../../core/network/api_exception.dart';
import '../services/reading_api_service.dart';
import '../../domain/models/highlight_entry.dart';
import '../../domain/models/reading_session_entry.dart';
import '../../domain/repository/reading_analytics_repository.dart';

class ReadingAnalyticsRepositoryImpl implements ReadingAnalyticsRepository {
  ReadingAnalyticsRepositoryImpl({ReadingApiService? apiService})
    : _apiService = apiService ?? ReadingApiService();

  final ReadingApiService _apiService;

  @override
  Future<List<HighlightEntry>> listHighlights() async {
    final raw = await _apiService.listHighlights();

    return raw.map(_mapHighlight).toList(growable: false);
  }

  @override
  Future<HighlightEntry> createHighlight({
    required String catalogItemId,
    required String cfi,
    String? text,
    String? note,
    String? color,
  }) async {
    final raw = await _apiService.createHighlight(
      catalogItemId: catalogItemId,
      cfi: cfi,
      text: text,
      note: note,
      color: color,
    );

    return _mapHighlight(raw);
  }

  @override
  Future<void> recordReadingSession({
    required String catalogItemId,
    required DateTime startedAt,
    required DateTime endedAt,
    int? durationSeconds,
    String? deviceId,
    Map<String, dynamic>? metadata,
  }) {
    return _apiService.recordReadingSession(
      catalogItemId: catalogItemId,
      startedAt: startedAt,
      endedAt: endedAt,
      durationSeconds: durationSeconds,
      deviceId: deviceId,
      metadata: metadata,
    );
  }

  @override
  Future<List<ReadingSessionEntry>> listReadingSessions() async {
    final raw = await _apiService.listReadingSessions();

    return raw
        .map((e) {
          final startedAtRaw = e['startedAt'];
          final endedAtRaw = e['endedAt'];

          final startedAt = startedAtRaw is String
              ? DateTime.tryParse(startedAtRaw)
              : null;
          final endedAt = endedAtRaw is String
              ? DateTime.tryParse(endedAtRaw)
              : null;

          if (startedAt == null || endedAt == null) {
            throw ApiException(message: 'Invalid reading session payload.');
          }

          return ReadingSessionEntry(
            catalogItemId: e['catalogItemId'] as String? ?? '',
            startedAt: startedAt,
            endedAt: endedAt,
            durationSeconds:
                (e['durationSeconds'] as num?)?.toInt() ??
                endedAt.difference(startedAt).inSeconds,
            deviceId: e['deviceId'] as String?,
          );
        })
        .toList(growable: false);
  }

  HighlightEntry _mapHighlight(Map<String, dynamic> e) {
    final highlightJson = e['highlight'];
    final highlightMap = highlightJson is Map
        ? highlightJson.map((k, v) => MapEntry(k.toString(), v))
        : const <String, dynamic>{};

    final createdAtRaw = e['createdAt'];
    final createdAt = createdAtRaw is String
        ? DateTime.tryParse(createdAtRaw)
        : null;

    final cfi = (highlightMap['cfi'] as String?) ?? (e['cfi'] as String?) ?? '';

    if (cfi.isEmpty) {
      throw ApiException(message: 'Invalid highlight payload.');
    }

    return HighlightEntry(
      id: e['id'] as String? ?? '',
      catalogItemId: e['catalogItemId'] as String? ?? '',
      cfi: cfi,
      text: highlightMap['text'] as String? ?? e['text'] as String?,
      note: highlightMap['note'] as String? ?? e['note'] as String?,
      color: highlightMap['color'] as String? ?? e['color'] as String?,
      createdAt: createdAt,
    );
  }
}
