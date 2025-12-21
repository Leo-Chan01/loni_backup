enum DownloadStatus { notDownloaded, downloading, downloaded, paused, failed }

class OfflineBookModel {
  final String bookId;
  final String title;
  final String author;
  final String coverImageUrl;
  final DownloadStatus status;
  final double downloadProgress;
  final String fileSize;

  const OfflineBookModel({
    required this.bookId,
    required this.title,
    required this.author,
    required this.coverImageUrl,
    required this.status,
    this.downloadProgress = 0.0,
    required this.fileSize,
  });

  OfflineBookModel copyWith({
    String? bookId,
    String? title,
    String? author,
    String? coverImageUrl,
    DownloadStatus? status,
    double? downloadProgress,
    String? fileSize,
  }) {
    return OfflineBookModel(
      bookId: bookId ?? this.bookId,
      title: title ?? this.title,
      author: author ?? this.author,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      status: status ?? this.status,
      downloadProgress: downloadProgress ?? this.downloadProgress,
      fileSize: fileSize ?? this.fileSize,
    );
  }
}
