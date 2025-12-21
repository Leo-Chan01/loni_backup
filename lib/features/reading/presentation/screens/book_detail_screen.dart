import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/reading/domain/models/book_detail_model.dart';
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
  bool _isDigitalSelected = true;
  bool _isFavorite = false;

  // Mock data - In production, this would come from a controller/service
  late final BookDetailModel _book;

  @override
  void initState() {
    super.initState();
    _book = const BookDetailModel(
      id: '1',
      title: 'Things Fall Apart',
      author: 'Chinua Achebe',
      coverImageUrl:
          'https://images.unsplash.com/photo-1544947950-fa07a98d237f?q=80&w=800&auto=format&fit=crop',
      rating: 4.8,
      reviewCount: '12.4k',
      pages: 209,
      genre: 'Fiction',
      publishedYear: '1958',
      description:
          'Things Fall Apart is the debut novel by Nigerian author Chinua Achebe, first published in 1958. It depicts pre-colonial life in the southeastern part of Nigeria and the invasion by Europeans during the late 19th century. It is seen as the archetypal modern African novel in English.',
      digitalPrice: '\$9.99',
      physicalPrice: '\$24.99',
    );
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  Future<void> _handleBuyNow() async {
    // Implement purchase logic
  }

  void _handlePreview() {
    context.push('/book-preview/${widget.bookId}');
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final selectedPrice = _isDigitalSelected
        ? _book.digitalPrice
        : _book.physicalPrice;

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
                  imageUrl: _book.coverImageUrl,
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
                          coverImageUrl: _book.coverImageUrl,
                          title: _book.title,
                          author: _book.author,
                          rating: _book.rating,
                          reviewCount: _book.reviewCount,
                        ),
                      ),

                      SizedBox(height: 20.h),

                      // Stats
                      BookStatsCard(
                        pages: _book.pages,
                        genre: _book.genre,
                        publishedYear: _book.publishedYear,
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
                        _book.description,
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
                        price: _book.digitalPrice,
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
                        price: _book.physicalPrice,
                        isSelected: !_isDigitalSelected,
                        onTap: () {
                          setState(() {
                            _isDigitalSelected = false;
                          });
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
