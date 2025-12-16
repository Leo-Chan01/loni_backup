class BookItem {
  const BookItem({
    required this.title,
    required this.author,
    required this.rating,
    required this.category,
    this.badge,
    this.priceLabel,
  });

  final String title;
  final String author;
  final double rating;
  final String category;
  final String? badge;
  final String? priceLabel; // For releases or priced lists
}
