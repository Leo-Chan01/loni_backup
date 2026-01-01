import 'package:loni_africa/features/discovery/data/services/discovery_service.dart';
import 'package:loni_africa/features/discovery/data/services/discovery_api_service.dart';
import 'package:loni_africa/features/discovery/domain/models/book_item.dart';
import 'package:loni_africa/features/discovery/domain/models/book.dart';
import 'package:loni_africa/features/discovery/domain/models/genre.dart';

class DiscoveryController {
  DiscoveryController(dynamic service) : _service = service;

  final dynamic _service;

  // Legacy methods for old service
  Future<List<BookItem>> featured() {
    if (_service is DiscoveryService) {
      return (_service).getFeaturedBooks();
    }
    return Future.value([]);
  }

  Future<List<BookItem>> trending() {
    if (_service is DiscoveryService) {
      return (_service).getTrendingBooks();
    }
    return Future.value([]);
  }

  Future<List<Genre>> genres() {
    if (_service is DiscoveryService) {
      return (_service).getGenres();
    }
    return Future.value([]);
  }

  Future<List<BookItem>> newReleases() {
    if (_service is DiscoveryService) {
      return (_service).getNewReleases();
    }
    return Future.value([]);
  }

  // New methods for API service
  Future<List<Book>> getBooks({
    String? category,
    String sort = 'popular',
  }) {
    if (_service is DiscoveryApiService) {
      return (_service).getBooks(
        category: category,
        sort: sort,
        pageSize: 50,
      );
    }
    return Future.value([]);
  }

  Future<List<Book>> getRecommendations() {
    if (_service is DiscoveryApiService) {
      return (_service).getRecommendations(limit: 20);
    }
    return Future.value([]);
  }
}
