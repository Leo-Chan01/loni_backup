import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/discovery/data/services/discovery_api_service.dart';
import 'package:loni_africa/features/discovery/presentation/controllers/discovery_controller.dart';
import 'package:loni_africa/shared/widgets/texture_overlay.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  static const String path = 'categories';
  static const String name = 'CategoriesScreen';

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late final DiscoveryController _discovery;
  List<String> _categories = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _discovery = DiscoveryController(DiscoveryApiService());
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    if (!mounted) return;
    setState(() => _isLoading = true);
    try {
      // Get books and extract unique categories
      final books = await _discovery.getBooks();
      final categories = <String>{};
      for (final book in books) {
        categories.addAll(book.categories);
      }
      if (!mounted) return;
      setState(() {
        _categories = categories.toList();
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

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
                          context.l10n.categories,
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onSurface,
                              ),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: colorScheme.outline.withValues(alpha: 0.2),
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: HugeIcon(
                            icon: HugeIcons.strokeRoundedSlidersVertical,
                            color: colorScheme.onSurface,
                            size: 18.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: _isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: colorScheme.primary,
                          ),
                        )
                      : GridView.builder(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 16.h,
                          ),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12.w,
                            mainAxisSpacing: 12.h,
                            childAspectRatio: 0.85,
                          ),
                          itemCount: _categories.length,
                          itemBuilder: (context, index) {
                            final category = _categories[index];
                            final isEven = index % 2 == 0;

                            return GestureDetector(
                              onTap: () {
                                context.push(
                                  '/app/explore?category=$category',
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      colorScheme.surfaceContainerHighest,
                                  borderRadius: BorderRadius.circular(16.r),
                                  border: Border.all(
                                    color: colorScheme.outline.withValues(
                                      alpha: 0.15,
                                    ),
                                    width: 1,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                top: -32.h,
                                right: -32.w,
                                child: Container(
                                  width: 80.w,
                                  height: 80.h,
                                  decoration: BoxDecoration(
                                    color:
                                        (isEven
                                                ? colorScheme.primary
                                                : colorScheme.tertiary)
                                            .withValues(alpha: 0.1),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(16.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 48.w,
                                      height: 48.h,
                                      decoration: BoxDecoration(
                                        color:
                                            (isEven
                                                    ? colorScheme.primary
                                                    : colorScheme.tertiary)
                                                .withValues(alpha: 0.1),
                                        borderRadius: BorderRadius.circular(
                                          12.r,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: HugeIcon(
                                          icon: _getGenreIcon(category),
                                          color: isEven
                                              ? colorScheme.primary
                                              : colorScheme.tertiary,
                                          size: 24.sp,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 12.h),
                                    Text(
                                      category,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: colorScheme.onSurface,
                                          ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      '${_categories.where((c) => c == category).length} books',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: colorScheme.onSurfaceVariant,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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

  dynamic _getGenreIcon(String category) {
    switch (category.toLowerCase()) {
      case 'fiction':
        return HugeIcons.strokeRoundedBook02;
      case 'history':
        return HugeIcons.strokeRoundedHourglassOff;
      case 'poetry':
        return HugeIcons.strokeRoundedPencilEdit02;
      case 'children':
        return HugeIcons.strokeRoundedChild;
      case 'education':
        return HugeIcons.strokeRoundedMortarboard01;
      case 'self-help':
        return HugeIcons.strokeRoundedBulb;
      case 'business':
        return HugeIcons.strokeRoundedBriefcase01;
      case 'romance':
        return HugeIcons.strokeRoundedFavourite;
      default:
        return HugeIcons.strokeRoundedBook02;
    }
  }
}
