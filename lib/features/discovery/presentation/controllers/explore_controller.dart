import 'package:loni_africa/features/discovery/data/services/discovery_api_service.dart';
import 'package:loni_africa/features/discovery/domain/models/book.dart';

class ExploreController {
  ExploreController(this._service);

  final DiscoveryApiService _service;

  Future<List<Book>> searchBooks(String query) async {
    if (query.isEmpty) return [];
    return _service.searchBooks(query: query);
  }

  Future<List<Book>> getBooks({
    String? category,
    String sort = 'popular',
  }) async {
    return _service.getBooks(
      category: category,
      sort: sort,
      pageSize: 50,
    );
  }

  Future<List<Book>> getRecommendations() async {
    return _service.getRecommendations(limit: 20);
  }
}
