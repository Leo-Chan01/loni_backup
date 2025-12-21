class ChapterModel {
  final String id;
  final int number;
  final String title;
  final int pageCount;
  final bool isRead;
  final double progress;
  final bool isCurrentChapter;

  const ChapterModel({
    required this.id,
    required this.number,
    required this.title,
    required this.pageCount,
    this.isRead = false,
    this.progress = 0.0,
    this.isCurrentChapter = false,
  });

  ChapterModel copyWith({
    String? id,
    int? number,
    String? title,
    int? pageCount,
    bool? isRead,
    double? progress,
    bool? isCurrentChapter,
  }) {
    return ChapterModel(
      id: id ?? this.id,
      number: number ?? this.number,
      title: title ?? this.title,
      pageCount: pageCount ?? this.pageCount,
      isRead: isRead ?? this.isRead,
      progress: progress ?? this.progress,
      isCurrentChapter: isCurrentChapter ?? this.isCurrentChapter,
    );
  }
}
