class ReadingSessionEntry {
  const ReadingSessionEntry({
    required this.catalogItemId,
    required this.startedAt,
    required this.endedAt,
    required this.durationSeconds,
    this.deviceId,
  });

  final String catalogItemId;
  final DateTime startedAt;
  final DateTime endedAt;
  final int durationSeconds;
  final String? deviceId;
}
