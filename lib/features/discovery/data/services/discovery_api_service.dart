import 'package:dio/dio.dart';
import 'package:loni_africa/core/network/api_client.dart';
import 'package:loni_africa/features/discovery/domain/models/book.dart';

class DiscoveryApiService {
  final Dio _dio = ApiClient.instance.dio;

  Future<Map<String, dynamic>> getHomeFeed({
    String? region,
    String? language,
    bool includeRecommendations = true,
  }) async {
    try {
      final response = await _dio.get(
        '/app/home',
        queryParameters: {
          if (region != null) 'region': region,
          if (language != null) 'language': language,
          'includeRecommendations': includeRecommendations,
        },
      );
      return response.data as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Book>> searchBooks({
    required String query,
    String? region,
    String? language,
    String? category,
    String sort = 'popular',
    int page = 1,
    int pageSize = 20,
  }) async {
    try {
      final response = await _dio.get(
        '/search',
        queryParameters: {
          'q': query,
          if (region != null) 'region': region,
          if (language != null) 'language': language,
          if (category != null) 'category': category,
          'sort': sort,
          'page': page,
          'pageSize': pageSize,
        },
      );

      final items = response.data['items'] as List<dynamic>?;
      if (items == null) return [];

      return items
          .map((item) => _mapToBook(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Book>> getBooks({
    String? region,
    String? language,
    String? category,
    String? type,
    String sort = 'popular',
    int page = 1,
    int pageSize = 20,
  }) async {
    try {
      final response = await _dio.get(
        '/books',
        queryParameters: {
          if (region != null) 'region': region,
          if (language != null) 'language': language,
          if (category != null) 'category': category,
          if (type != null) 'type': type,
          'sort': sort,
          'page': page,
          'pageSize': pageSize,
        },
      );

      final items = response.data['items'] as List<dynamic>?;
      if (items == null) return [];

      return items
          .map((item) => _mapToBook(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<Book> getBookDetail(String bookId) async {
    try {
      final response = await _dio.get('/books/$bookId');
      return _mapToBook(response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Book>> getRecommendations({int limit = 20}) async {
    try {
      final response = await _dio.get(
        '/recommendations',
        queryParameters: {'limit': limit},
      );

      final items = response.data['items'] as List<dynamic>?;
      if (items == null) return [];

      return items
          .map((item) => _mapToBook(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Book _mapToBook(Map<String, dynamic> json) {
    return Book(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? 'Unknown',
      subtitle: json['subtitle'] as String? ?? '',
      description: json['description'] as String? ?? '',
      authors: (json['authors'] as List<dynamic>? ?? [])
          .map((a) => BookAuthor(
                fullName: a['fullName'] as String? ?? 'Unknown',
                role: a['role'] as String? ?? 'author',
              ))
          .toList(),
      coverImageUrl: json['coverImageUrl'] as String? ?? '',
      heroImageUrl: json['heroImageUrl'] as String?,
      priceCents: json['priceCents'] as int? ?? 0,
      currency: json['currency'] as String? ?? 'XOF',
      pageCount: json['pageCount'] as int? ?? 0,
      languageCode: json['languageCode'] as String? ?? 'en',
      releaseDate: json['releaseDate'] as String? ?? '',
      categories: List<String>.from(json['categories'] as List<dynamic>? ?? []),
      tags: List<String>.from(json['tags'] as List<dynamic>? ?? []),
      availability: (json['availability'] as List<dynamic>? ?? [])
          .map((a) => BookAvailability(
                regionCode: a['regionCode'] as String? ?? '',
                channel: a['channel'] as String? ?? '',
                priceCents: a['priceCents'] as int? ?? 0,
                currency: a['currency'] as String? ?? '',
              ))
          .toList(),
      hardcopyAvailable: json['hardcopyAvailable'] as bool? ?? false,
      sampleUrl: json['sampleUrl'] as String?,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: json['reviewCount'] as int? ?? 0,
    );
  }
}
