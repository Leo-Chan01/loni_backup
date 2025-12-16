import 'package:loni_africa/features/discovery/data/services/search_service.dart';
import 'package:loni_africa/features/discovery/domain/models/search_result.dart';

class SearchController {
  SearchController(this._service);

  final SearchService _service;

  Future<List<SearchResult>> search(String query, SearchFilter filter) async {
    return _service.search(query: query, filter: filter);
  }
}
