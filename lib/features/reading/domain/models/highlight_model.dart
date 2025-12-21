enum HighlightType { highlight, note, bookmark }

class HighlightModel {
  final String id;
  final String bookId;
  final HighlightType type;
  final String chapterTitle;
  final int pageNumber;
  final String? text;
  final String? note;
  final DateTime createdAt;

  const HighlightModel({
    required this.id,
    required this.bookId,
    required this.type,
    required this.chapterTitle,
    required this.pageNumber,
    this.text,
    this.note,
    required this.createdAt,
  });

  String get relativeTime {
    final now = DateTime.now();
    final difference = now.difference(createdAt);

    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        return '${difference.inMinutes} minutes ago';
      }
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 30) {
      return '${(difference.inDays / 7).floor()} weeks ago';
    } else {
      return '${(difference.inDays / 30).floor()} months ago';
    }
  }

  HighlightModel copyWith({
    String? id,
    String? bookId,
    HighlightType? type,
    String? chapterTitle,
    int? pageNumber,
    String? text,
    String? note,
    DateTime? createdAt,
  }) {
    return HighlightModel(
      id: id ?? this.id,
      bookId: bookId ?? this.bookId,
      type: type ?? this.type,
      chapterTitle: chapterTitle ?? this.chapterTitle,
      pageNumber: pageNumber ?? this.pageNumber,
      text: text ?? this.text,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
