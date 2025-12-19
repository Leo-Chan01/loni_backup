import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/discovery/data/services/discovery_service.dart';
import 'package:loni_africa/features/discovery/domain/models/book_item.dart';
import 'package:loni_africa/features/discovery/presentation/controllers/discovery_controller.dart';
import 'package:loni_africa/shared/widgets/book_grid_card.dart';
import 'package:loni_africa/shared/widgets/filter_chip_row.dart';
import 'package:loni_africa/shared/widgets/texture_overlay.dart';

class CategoryDetailScreen extends StatefulWidget {
  const CategoryDetailScreen({super.key, this.categoryId});

  static const String path = 'category-detail';
  static const String name = 'CategoryDetailScreen';

  final String? categoryId;

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  late final DiscoveryController _discovery;
  List<BookItem> _books = const [];
  int _selectedFilterIndex = 0;

  List<String> _getFilterLabels(BuildContext context) => [
    context.l10n.popular,
    context.l10n.newFilter,
    context.l10n.bestsellers,
    context.l10n.priceLow,
  ];

  @override
  void initState() {
    super.initState();
    _discovery = DiscoveryController(DiscoveryService());
    _loadBooks();
  }

  Future<void> _loadBooks() async {
    final books = await _discovery.newReleases();
    if (!mounted) return;
    setState(() {
      _books = books;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final category = widget.categoryId ?? 'Fiction';
    final filters = _getFilterLabels(context);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Stack(
        children: [
          const TextureOverlay(),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: HugeIcon(
                          icon: HugeIcons.strokeRoundedArrowLeft01,
                          color: colorScheme.onSurface,
                          size: 24.sp,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                          category,
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onSurface,
                              ),
                        ),
                      ),
                      Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            color: colorScheme.outline.withValues(alpha: 0.2),
                            width: 1,
                          ),
                        ),
                        child: HugeIcon(
                          icon: HugeIcons.strokeRoundedSlidersHorizontal,
                          color: colorScheme.onSurface,
                          size: 18.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: FilterChipRow(
                    labels: filters,
                    selectedIndex: _selectedFilterIndex,
                    onSelected: (index) {
                      setState(() {
                        _selectedFilterIndex = index;
                      });
                    },
                  ),
                ),
                SizedBox(height: 16.h),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.booksInCategory(_books.length, category),
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: colorScheme.onSurfaceVariant),
                        ),
                        SizedBox(height: 16.h),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12.w,
                                mainAxisSpacing: 20.h,
                                childAspectRatio: 0.55,
                              ),
                          itemCount: _books.length,
                          itemBuilder: (context, index) {
                            final book = _books[index];
                            return BookGridCard(
                              title: book.title,
                              author: book.author,
                              price: book.priceLabel ?? '\$9.99',
                              rating: book.rating,
                              imageUrl:
                                  'https://images.unsplash.com/photo-1544947950-fa07a98d237f?q=80&w=300',
                              isFavorite: index == 2,
                              onTap: () {},
                              onFavoriteToggle: () {},
                            );
                          },
                        ),
                        SizedBox(height: 24.h),
                      ],
                    ),
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
