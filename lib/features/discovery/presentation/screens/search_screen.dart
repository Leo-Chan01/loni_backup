import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/discovery/data/services/discovery_api_service.dart';
import 'package:loni_africa/features/discovery/domain/models/book.dart';
import 'package:loni_africa/shared/widgets/book_list_item.dart';
import 'package:loni_africa/shared/widgets/filter_chip_row.dart';
import 'package:loni_africa/shared/widgets/search_top_bar.dart';
import 'package:loni_africa/shared/widgets/texture_overlay.dart';
import 'package:loni_africa/shared/widgets/empty_state_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, this.initialQuery});

  static const String path = 'search';
  static const String name = 'SearchScreen';

  final String? initialQuery;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _controller;
  late final DiscoveryApiService _apiService;
  String _sortBy = 'relevance';
  bool _loading = false;
  List<Book> _results = [];

  final _sortOptions = ['relevance', 'popularity', 'newest'];

  List<String> getSortTabs(BuildContext context) => [
        context.l10n.relevance,
        context.l10n.popularity,
        context.l10n.newest,
      ];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialQuery ?? '');
    _apiService = DiscoveryApiService();
    if (_controller.text.isNotEmpty) {
      _runSearch(_controller.text);
    }
  }

  Future<void> _runSearch(String query) async {
    if (query.trim().isEmpty) {
      setState(() => _results = []);
      return;
    }
    setState(() => _loading = true);
    try {
      final results = await _apiService.searchBooks(
        query: query,
        sort: _sortBy,
      );
      if (!mounted) return;
      setState(() {
        _results = results;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _loading = false);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Stack(
        children: [
          const TextureOverlay(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12.h),
                  SearchTopBar(
                    controller: _controller,
                    onSubmitted: _runSearch,
                  ),
                  SizedBox(height: 12.h),
                  FilterChipRow(
                    labels: getSortTabs(context),
                    selectedIndex: _sortOptions.indexOf(_sortBy),
                    onSelected: (i) {
                      setState(() => _sortBy = _sortOptions[i]);
                      if (_controller.text.isNotEmpty) {
                        _runSearch(_controller.text);
                      }
                    },
                  ),
                  SizedBox(height: 12.h),
                  if (_controller.text.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.only(left: 4.w, bottom: 8.h),
                      child: Text(
                        'Found ${_results.length} results for "${_controller.text}"',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  Expanded(
                    child: _loading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: colorScheme.primary,
                            ),
                          )
                        : _results.isEmpty && _controller.text.isNotEmpty
                            ? EmptyStateWidget(
                                title: context.l10n.noResults,
                                message: context.l10n.tryAnotherSearch,
                                iconData: Icons.search_off_rounded,
                              )
                            : ListView.separated(
                                padding: EdgeInsets.only(bottom: 20.h),
                                itemCount: _results.length,
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 12.h),
                                itemBuilder: (context, index) {
                                  final book = _results[index];
                                  return BookListItem(
                                    title: book.title,
                                    author: book.authors.isNotEmpty
                                        ? book.authors[0].fullName
                                        : 'Unknown',
                                    rating: book.rating,
                                    reviewCount: book.reviewCount,
                                    coverImageUrl: book.coverImageUrl,
                                    onTap: () {
                                      context.push('/book-detail/${book.id}');
                                    },
                                  );
                                },
                              ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
