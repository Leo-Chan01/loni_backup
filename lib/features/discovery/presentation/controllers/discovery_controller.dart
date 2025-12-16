import 'package:loni_africa/features/discovery/data/services/discovery_service.dart';
import 'package:loni_africa/features/discovery/domain/models/book_item.dart';
import 'package:loni_africa/features/discovery/domain/models/genre.dart';

class DiscoveryController {
  DiscoveryController(this._service);

  final DiscoveryService _service;

  Future<List<BookItem>> featured() => _service.getFeaturedBooks();
  Future<List<BookItem>> trending() => _service.getTrendingBooks();
  Future<List<Genre>> genres() => _service.getGenres();
  Future<List<BookItem>> newReleases() => _service.getNewReleases();
}
