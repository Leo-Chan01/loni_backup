import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/discovery/data/services/discovery_api_service.dart';
import 'package:loni_africa/features/discovery/domain/models/book.dart';
import 'package:loni_africa/features/discovery/presentation/controllers/explore_controller.dart';
import 'package:loni_africa/main.dart';
import 'package:loni_africa/shared/widgets/empty_state_widget.dart';
import 'package:loni_africa/shared/widgets/book_list_item.dart';
import 'package:loni_africa/shared/widgets/screen_header.dart';
import 'package:loni_africa/shared/widgets/search_bar.dart' as search_widgets;
import 'package:loni_africa/shared/widgets/sort_filter_chip.dart';
import 'package:loni_africa/shared/widgets/texture_overlay.dart';
import 'package:loni_africa/shared/widgets/theme_toggle_button.dart';

class ExploreRootScreen extends StatefulWidget {
  const ExploreRootScreen({super.key});

  static const String path = '/app/explore';
  static const String name = 'ExploreRootScreen';

  @override
  State<ExploreRootScreen> createState() => _ExploreRootScreenState();
}

class _ExploreRootScreenState extends State<ExploreRootScreen> {
  late final ExploreController _controller;
  late final TextEditingController _searchController;
  List<Book> _books = [];
  String _selectedSort = 'popular';
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _controller = ExploreController(DiscoveryApiService());
    _searchController = TextEditingController();
    _loadInitialBooks();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadInitialBooks() async {
    if (!mounted) return;
    setState(() => _isLoading = true);
    try {
      final books = await _controller.getBooks(sort: _selectedSort);
      if (mounted) {
        setState(() {
          _books = books;
          _errorMessage = null;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _searchBooks(String query) async {
    if (query.isEmpty) {
      await _loadInitialBooks();
      return;
    }

    if (!mounted) return;
    setState(() => _isLoading = true);
    try {
      final books = await _controller.searchBooks(query);
      if (mounted) {
        setState(() {
          _books = books;
          _errorMessage = null;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  void _onSortChanged(String sort) {
    if (_selectedSort != sort) {
      setState(() => _selectedSort = sort);
      if (_searchController.text.isEmpty) {
        _loadInitialBooks();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final themeNotifier = ThemeNotifier.of(context);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Stack(
        children: [
          const TextureOverlay(),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.h),
                      ScreenHeader(
                        title: context.l10n.explore,
                        subtitle: context.l10n.searchBooksAuthors,
                        showBackButton: false,
                        trailingWidget: ThemeToggleButton(
                          onToggle: themeNotifier.onToggle,
                        ),
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
                search_widgets.SearchBar(
                  hintText: context.l10n.searchForBooks,
                  controller: _searchController,
                  onChanged: (value) => _searchBooks(value),
                  onClear: () => _loadInitialBooks(),
                ),
                SizedBox(height: 12.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      SortFilterChip(
                        label: context.l10n.popular,
                        isSelected: _selectedSort == 'popular',
                        onTap: () => _onSortChanged('popular'),
                      ),
                      SizedBox(width: 8.w),
                      SortFilterChip(
                        label: context.l10n.newFilter,
                        isSelected: _selectedSort == 'new',
                        onTap: () => _onSortChanged('new'),
                      ),
                      SizedBox(width: 8.w),
                      SortFilterChip(
                        label: context.l10n.bestsellers,
                        isSelected: _selectedSort == 'bestsellers',
                        onTap: () => _onSortChanged('bestsellers'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                Expanded(
                  child: _isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: colorScheme.primary,
                          ),
                        )
                      : _errorMessage != null
                          ? Center(
                              child: EmptyStateWidget(
                                title: context.l10n.error,
                                message: _errorMessage!,
                                iconData: Icons.error_outline,
                              ),
                            )
                          : _books.isEmpty
                              ? EmptyStateWidget(
                                  title: 'No Results',
                                  message: 'Try searching with different keywords',
                                )
                              : ListView.builder(
                                  itemCount: _books.length,
                                  itemBuilder: (context, index) {
                                    final book = _books[index];
                                    final authors = book.authors.isNotEmpty
                                        ? book.authors[0].fullName
                                        : 'Unknown';
                                    return BookListItem(
                                      title: book.title,
                                      author: authors,
                                      coverImageUrl: book.coverImageUrl,
                                      rating: book.rating,
                                      reviewCount: book.reviewCount,
                                      onTap: () {
                                        // Navigate to book detail
                                      },
                                    );
                                  },
                                ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
