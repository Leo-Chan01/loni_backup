import 'dart:async';

import 'package:loni_africa/features/discovery/domain/models/book_item.dart';
import 'package:loni_africa/features/discovery/domain/models/genre.dart';

class DiscoveryService {
  Future<List<BookItem>> getFeaturedBooks() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const [
      BookItem(
        title: 'Daughters of the Dust',
        author: 'Julie Dash',
        rating: 4.8,
        category: 'Fiction',
        badge: 'Editor’s Pick',
      ),
      BookItem(
        title: 'Things Fall Apart',
        author: 'Chinua Achebe',
        rating: 4.9,
        category: 'Fiction',
        badge: 'Classic',
      ),
      BookItem(
        title: 'Freshwater',
        author: 'Akwaeke Emezi',
        rating: 4.7,
        category: 'Fiction',
        badge: 'Trending',
      ),
      BookItem(
        title: 'We Should All Be Feminists',
        author: 'Chimamanda Ngozi Adichie',
        rating: 4.6,
        category: 'Essays',
        badge: 'Featured',
      ),
    ];
  }

  Future<List<BookItem>> getTrendingBooks() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const [
      BookItem(
        title: 'Half of a Yellow Sun',
        author: 'Chimamanda Adichie',
        rating: 4.8,
        category: 'Fiction',
      ),
      BookItem(
        title: 'Americanah',
        author: 'Chimamanda Adichie',
        rating: 4.7,
        category: 'Fiction',
      ),
      BookItem(
        title: 'The Famished Road',
        author: 'Ben Okri',
        rating: 4.5,
        category: 'Fiction',
      ),
    ];
  }

  Future<List<Genre>> getGenres() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return const [
      Genre(title: 'Fiction', countLabel: '2,340 books'),
      Genre(title: 'History', countLabel: '1,120 books'),
      Genre(title: 'Poetry', countLabel: '890 books'),
      Genre(title: 'Children', countLabel: '1,560 books'),
    ];
  }

  Future<List<BookItem>> getNewReleases() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const [
      BookItem(
        title: 'The Joys of Motherhood',
        author: 'Buchi Emecheta',
        rating: 0,
        category: 'Fiction',
        priceLabel: '\$12.99',
      ),
      BookItem(
        title: 'Purple Hibiscus',
        author: 'Chimamanda Adichie',
        rating: 0,
        category: 'Fiction',
        priceLabel: '\$14.99',
      ),
    ];
  }
}
