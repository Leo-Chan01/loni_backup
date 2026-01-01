import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/discovery/data/services/discovery_api_service.dart';
import 'package:loni_africa/features/discovery/domain/models/book.dart';
import 'package:loni_africa/features/reading/presentation/widgets/book_hero_image.dart';
import 'package:loni_africa/features/reading/presentation/widgets/book_info_section.dart';
import 'package:loni_africa/features/reading/presentation/widgets/book_stats_card.dart';
import 'package:loni_africa/features/reading/presentation/widgets/format_option_card.dart';
import 'package:loni_africa/shared/widgets/primary_button.dart';
import 'package:loni_africa/shared/widgets/secondary_button.dart';
import 'package:loni_africa/shared/widgets/texture_overlay.dart';

class BookDetailScreen extends StatefulWidget {
  final String bookId;

  const BookDetailScreen({super.key, required this.bookId});

  static const String path = '/book-detail/:bookId';
  static const String name = 'BookDetailScreen';

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  late final DiscoveryApiService _apiService;
  Book? _book;
  bool _isDigitalSelected = true;
  bool _isFavorite = false;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _apiService = DiscoveryApiService();
    _loadBook();
  }

  Future<void> _loadBook() async {
    if (!mounted) return;
    setState(() => _isLoading = true);
    try {
      final book = await _apiService.getBookDetail(widget.bookId);
      if (!mounted) return;
      setState(() {
        _book = book;
        _errorMessage = null;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  Future<void> _handleBuyNow() async {
    if (_book == null) return;
    context.push('/checkout/${widget.bookId}');
  }

  void _handlePreview() {
    context.push('/book-preview/${widget.bookId}');
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (_isLoading) {
      return Scaffold(
        backgroundColor: colorScheme.surface,
        body: Center(
          child: CircularProgressIndicator(color: colorScheme.primary),
        ),
      );
    }

    if (_errorMessage != null || _book == null) {
      return Scaffold(
        backgroundColor: colorScheme.surface,
        body: Center(
          child: Text(_errorMessage ?? 'Failed to load book'),
        ),
      );
    }

    final book = _book!;
    final selectedPrice = _isDigitalSelected
        ? '${(book.priceCents / 100).toStringAsFixed(2)} ${book.currency}'
        : '${(book.priceCents / 100).toStringAsFixed(2)} ${book.currency}';

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Stack(
        children: [
          const TextureOverlay(),
          CustomScrollView(
            slivers: [
              // Hero Image
              SliverToBoxAdapter(
                child: BookHeroImage(
                  imageUrl: book.coverImageUrl,
                  onBackPressed: () => context.pop(),
                  onFavoritePressed: _toggleFavorite,
                  isFavorite: _isFavorite,
                ),
              ),

              // Content
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Book Info
                      Transform.translate(
                        offset: Offset(0, -64.h),
                        child: BookInfoSection(
                          coverImageUrl: book.coverImageUrl,
                          title: book.title,
                          author: book.authors.isNotEmpty
                              ? book.authors[0].fullName
                              : 'Unknown',
                          rating: book.rating,
                          reviewCount: book.reviewCount.toString(),
                        ),
                      ),

                      SizedBox(height: 20.h),

                      // Stats
                      BookStatsCard(
                        pages: _book!.pageCount,
                        genre: _book!.categories.isNotEmpty
                            ? _book!.categories[0]
                            : 'Unknown',
                        publishedYear: _book!.releaseDate.split('-')[0],
                      ),

                      SizedBox(height: 24.h),

                      // Description
                      Text(
                        context.l10n.aboutThisBook,
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        _book!.description,
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          height: 1.6,
                        ),
                      ),

                      SizedBox(height: 24.h),

                      // Pricing Options
                      Text(
                        context.l10n.chooseFormat,
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      FormatOptionCard(
                        icon: Icons.phonelink_rounded,
                        title: context.l10n.digitalEdition,
                        subtitle: context.l10n.readOnAnyDevice,
                        price:
                            '${(_book!.priceCents / 100).toStringAsFixed(2)} ${_book!.currency}',
                        isSelected: _isDigitalSelected,
                        onTap: () {
                          setState(() {
                            _isDigitalSelected = true;
                          });
                        },
                      ),
                      SizedBox(height: 12.h),
                      FormatOptionCard(
                        icon: Icons.menu_book_rounded,
                        title: context.l10n.hardcopy,
                        subtitle: context.l10n.printedAndDelivered,
                        price: _book!.hardcopyAvailable
                            ? '${(_book!.priceCents / 100).toStringAsFixed(2)} ${_book!.currency}'
                            : context.l10n.notAvailable,
                        isSelected: !_isDigitalSelected && _book!.hardcopyAvailable,
                        onTap: () {
                          if (_book!.hardcopyAvailable) {
                            setState(() {
                              _isDigitalSelected = false;
                            });
                          }
                        },
                      ),

                      SizedBox(height: 24.h),

                      // Action Buttons
                      PrimaryButton(
                        text: context.l10n.buyNow(selectedPrice),
                        onPressed: _handleBuyNow,
                      ),
                      SizedBox(height: 12.h),
                      SecondaryButton(
                        text: context.l10n.readFreePreview,
                        onPressed: _handlePreview,
                      ),

                      SizedBox(height: 32.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
