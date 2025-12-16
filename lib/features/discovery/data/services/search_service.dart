import 'dart:async';

import 'package:loni_africa/features/discovery/domain/models/search_result.dart';

enum SearchFilter { all, books, authors, publishers }

class SearchService {
  Future<List<SearchResult>> search({
    required String query,
    required SearchFilter filter,
  }) async {
    // Simulated delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Simple mocked results; in real app hook to API
    final all = <SearchResult>[
      const SearchResult(
        title: 'Things Fall Apart',
        author: 'Chinua Achebe',
        rating: 4.8,
        reviewsLabel: '12.4k reviews',
            priceLabel: '\$9.99',
      ),
      const SearchResult(
        title: 'No Longer at Ease',
        author: 'Chinua Achebe',
        rating: 4.6,
        reviewsLabel: '8.2k reviews',
            priceLabel: '\$8.99',
      ),
      const SearchResult(
        title: 'Arrow of God',
        author: 'Chinua Achebe',
        rating: 4.7,
        reviewsLabel: '9.8k reviews',
            priceLabel: '\$10.99',
      ),
    ];

    // For now filter has no effect; return same data
    return all;
  }
}
