import 'package:equatable/equatable.dart';

class BookAuthor extends Equatable {
  const BookAuthor({
    required this.fullName,
    this.role = 'author',
  });

  final String fullName;
  final String role;

  @override
  List<Object?> get props => [fullName, role];
}

class BookAvailability extends Equatable {
  const BookAvailability({
    required this.regionCode,
    required this.channel,
    required this.priceCents,
    required this.currency,
  });

  final String regionCode;
  final String channel;
  final int priceCents;
  final String currency;

  @override
  List<Object?> get props => [regionCode, channel, priceCents, currency];
}

class Book extends Equatable {
  const Book({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.authors,
    required this.coverImageUrl,
    this.heroImageUrl,
    required this.priceCents,
    required this.currency,
    required this.pageCount,
    required this.languageCode,
    required this.releaseDate,
    required this.categories,
    required this.tags,
    required this.availability,
    required this.hardcopyAvailable,
    this.sampleUrl,
    this.rating = 0.0,
    this.reviewCount = 0,
  });

  final String id;
  final String title;
  final String subtitle;
  final String description;
  final List<BookAuthor> authors;
  final String coverImageUrl;
  final String? heroImageUrl;
  final int priceCents;
  final String currency;
  final int pageCount;
  final String languageCode;
  final String releaseDate;
  final List<String> categories;
  final List<String> tags;
  final List<BookAvailability> availability;
  final bool hardcopyAvailable;
  final String? sampleUrl;
  final double rating;
  final int reviewCount;

  @override
  List<Object?> get props => [
        id,
        title,
        subtitle,
        description,
        authors,
        coverImageUrl,
        heroImageUrl,
        priceCents,
        currency,
        pageCount,
        languageCode,
        releaseDate,
        categories,
        tags,
        availability,
        hardcopyAvailable,
        sampleUrl,
        rating,
        reviewCount,
      ];
}
