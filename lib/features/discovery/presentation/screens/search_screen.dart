import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loni_africa/features/discovery/data/services/search_service.dart';
import 'package:loni_africa/features/discovery/domain/models/search_result.dart';
import 'package:loni_africa/features/discovery/presentation/controllers/search_controller.dart' as discovery;
import 'package:loni_africa/shared/widgets/filter_chip_row.dart';
import 'package:loni_africa/shared/widgets/search_result_card.dart';
import 'package:loni_africa/shared/widgets/search_top_bar.dart';
import 'package:loni_africa/shared/widgets/texture_overlay.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, this.initialQuery});

  static const String path = '/app/explore/search';
  static const String name = 'SearchScreen';

  final String? initialQuery;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _controller;
  late final discovery.SearchController _searchController;
  SearchFilter _filter = SearchFilter.all;
  bool _loading = false;
  List<SearchResult> _results = const [];

  final _tabs = const ['All', 'Books', 'Authors', 'Publishers'];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialQuery ?? '');
    _searchController = discovery.SearchController(SearchService());
    if (_controller.text.isNotEmpty) {
      _runSearch(_controller.text);
    }
  }

  Future<void> _runSearch(String query) async {
    setState(() => _loading = true);
    final results = await _searchController.search(query, _filter);
    if (!mounted) return;
    setState(() {
      _results = results;
      _loading = false;
    });
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
                    labels: _tabs,
                    selectedIndex: _filter.index,
                    onSelected: (i) {
                      setState(() => _filter = SearchFilter.values[i]);
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
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.separated(
                            padding: EdgeInsets.only(bottom: 20.h),
                            itemCount: _results.length,
                            separatorBuilder: (context, index) => SizedBox(height: 12.h),
                            itemBuilder: (context, index) {
                              final it = _results[index];
                              return SearchResultCard(
                                title: it.title,
                                author: it.author,
                                rating: it.rating,
                                reviewsLabel: it.reviewsLabel,
                                priceLabel: it.priceLabel,
                                onView: () {},
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
