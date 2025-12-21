class Bookmark {
  final String id;
  final String bookId;
  final String bookTitle;
  final String bookAuthor;
  final String? bookCoverUrl;
  final String quoteText;
  final int chapterNumber;
  final int pageNumber;
  final DateTime savedAt;

  const Bookmark({
    required this.id,
    required this.bookId,
    required this.bookTitle,
    required this.bookAuthor,
    this.bookCoverUrl,
    required this.quoteText,
    required this.chapterNumber,
    required this.pageNumber,
    required this.savedAt,
  });

  String get location => 'Chapter $chapterNumber, Page $pageNumber';
}
