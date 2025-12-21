class ReadingProgressModel {
  final String bookId;
  final int currentPage;
  final int totalPages;
  final double progressPercent;
  final int pagesRead;
  final int pagesLeft;
  final String timeLeft;
  final DateTime lastReadAt;

  const ReadingProgressModel({
    required this.bookId,
    required this.currentPage,
    required this.totalPages,
    required this.progressPercent,
    required this.pagesRead,
    required this.pagesLeft,
    required this.timeLeft,
    required this.lastReadAt,
  });

  ReadingProgressModel copyWith({
    String? bookId,
    int? currentPage,
    int? totalPages,
    double? progressPercent,
    int? pagesRead,
    int? pagesLeft,
    String? timeLeft,
    DateTime? lastReadAt,
  }) {
    return ReadingProgressModel(
      bookId: bookId ?? this.bookId,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      progressPercent: progressPercent ?? this.progressPercent,
      pagesRead: pagesRead ?? this.pagesRead,
      pagesLeft: pagesLeft ?? this.pagesLeft,
      timeLeft: timeLeft ?? this.timeLeft,
      lastReadAt: lastReadAt ?? this.lastReadAt,
    );
  }
}
