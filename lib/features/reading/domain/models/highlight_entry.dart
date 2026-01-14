class HighlightEntry {
  const HighlightEntry({
    required this.id,
    required this.catalogItemId,
    required this.cfi,
    this.text,
    this.note,
    this.color,
    this.createdAt,
  });

  final String id;
  final String catalogItemId;
  final String cfi;
  final String? text;
  final String? note;
  final String? color;
  final DateTime? createdAt;

  bool get hasNote => note != null && note!.trim().isNotEmpty;
}
