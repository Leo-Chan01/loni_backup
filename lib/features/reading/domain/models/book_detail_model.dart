class BookDetailModel {
  final String id;
  final String title;
  final String author;
  final String coverImageUrl;
  final double rating;
  final String reviewCount;
  final int pages;
  final String genre;
  final String publishedYear;
  final String description;
  final String digitalPrice;
  final String physicalPrice;
  final bool isInLibrary;
  final bool isFavorite;

  const BookDetailModel({
    required this.id,
    required this.title,
    required this.author,
    required this.coverImageUrl,
    required this.rating,
    required this.reviewCount,
    required this.pages,
    required this.genre,
    required this.publishedYear,
    required this.description,
    required this.digitalPrice,
    required this.physicalPrice,
    this.isInLibrary = false,
    this.isFavorite = false,
  });

  BookDetailModel copyWith({
    String? id,
    String? title,
    String? author,
    String? coverImageUrl,
    double? rating,
    String? reviewCount,
    int? pages,
    String? genre,
    String? publishedYear,
    String? description,
    String? digitalPrice,
    String? physicalPrice,
    bool? isInLibrary,
    bool? isFavorite,
  }) {
    return BookDetailModel(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      pages: pages ?? this.pages,
      genre: genre ?? this.genre,
      publishedYear: publishedYear ?? this.publishedYear,
      description: description ?? this.description,
      digitalPrice: digitalPrice ?? this.digitalPrice,
      physicalPrice: physicalPrice ?? this.physicalPrice,
      isInLibrary: isInLibrary ?? this.isInLibrary,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
