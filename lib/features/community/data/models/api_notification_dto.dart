class ApiNotificationDto {
  const ApiNotificationDto({
    required this.id,
    required this.type,
    required this.title,
    required this.body,
    required this.data,
    required this.readAt,
    required this.createdAt,
  });

  final String id;
  final String type;
  final String title;
  final String body;
  final Map<String, dynamic> data;
  final DateTime? readAt;
  final DateTime createdAt;

  factory ApiNotificationDto.fromJson(Map<String, dynamic> json) {
    return ApiNotificationDto(
      id: (json['id'] ?? '').toString(),
      type: (json['type'] ?? '').toString(),
      title: (json['title'] ?? '').toString(),
      body: (json['body'] ?? '').toString(),
      data: _asMap(json['data']),
      readAt: _tryParseDateTime(json['readAt']),
      createdAt: _tryParseDateTime(json['createdAt']) ?? DateTime.now().toUtc(),
    );
  }

  static Map<String, dynamic> _asMap(Object? value) {
    if (value is Map<String, dynamic>) return value;
    if (value is Map) {
      return value.map((k, v) => MapEntry(k.toString(), v));
    }
    return <String, dynamic>{};
  }

  static DateTime? _tryParseDateTime(Object? value) {
    if (value == null) return null;
    final raw = value.toString();
    if (raw.isEmpty) return null;
    return DateTime.tryParse(raw);
  }
}
