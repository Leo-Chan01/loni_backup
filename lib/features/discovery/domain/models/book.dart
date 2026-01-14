import 'package:equatable/equatable.dart';

class BookAuthor extends Equatable {
  const BookAuthor({required this.fullName, this.role = 'author'});

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

class BookDrmInfo extends Equatable {
  const BookDrmInfo({
    required this.licenseId,
    required this.deviceLimit,
    required this.licenseStatus,
    required this.activatedDevices,
    this.expiresAt,
    this.fileId,
  });

  final String licenseId;
  final int deviceLimit;
  final String licenseStatus;
  final int activatedDevices;
  final DateTime? expiresAt;

  /// Optional. Some backends include a content file identifier alongside DRM.
  final String? fileId;

  @override
  List<Object?> get props => [
    licenseId,
    deviceLimit,
    licenseStatus,
    activatedDevices,
    expiresAt,
    fileId,
  ];
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
    this.fileId,
    this.drm,
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

  /// Optional. Content file identifier used by `/v1/content/:fileId/...`.
  final String? fileId;

  /// Optional. Populated only when API includes DRM info.
  final BookDrmInfo? drm;
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
    fileId,
    drm,
    rating,
    reviewCount,
  ];
}
