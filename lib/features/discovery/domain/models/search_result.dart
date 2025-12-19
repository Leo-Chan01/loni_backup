class SearchResult {
  const SearchResult({
    required this.title,
    required this.author,
    required this.rating,
    required this.reviewsLabel,
    required this.priceLabel,
    this.thumbnailUrl,
  });

  final String title;
  final String author;
  final double rating;
  final String reviewsLabel; // e.g., '12.4k reviews'
  final String priceLabel; // e.g., '$9.99'
  final String? thumbnailUrl;
}
