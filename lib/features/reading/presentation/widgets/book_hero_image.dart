import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookHeroImage extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onBackPressed;
  final VoidCallback onFavoritePressed;
  final bool isFavorite;

  const BookHeroImage({
    super.key,
    required this.imageUrl,
    required this.onBackPressed,
    required this.onFavoritePressed,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 320.h,
      child: Stack(
        children: [
          // Hero Image
          Positioned.fill(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: colorScheme.surfaceContainerHighest,
                  child: Icon(
                    Icons.book,
                    size: 80.sp,
                    color: colorScheme.onSurfaceVariant,
                  ),
                );
              },
            ),
          ),

          // Gradient Overlay
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    colorScheme.surface.withValues(alpha: 0.3),
                    colorScheme.surface,
                  ],
                  stops: const [0.0, 0.7, 1.0],
                ),
              ),
            ),
          ),

          // Back Button
          Positioned(
            top: 48.h,
            left: 20.w,
            child: GestureDetector(
              onTap: onBackPressed,
              child: Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: colorScheme.surface.withValues(alpha: 0.8),
                  border: Border.all(
                    color: colorScheme.outline.withValues(alpha: 0.2),
                  ),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: colorScheme.onSurface,
                  size: 20.sp,
                ),
              ),
            ),
          ),

          // Favorite Button
          Positioned(
            top: 48.h,
            right: 72.w,
            child: GestureDetector(
              onTap: onFavoritePressed,
              child: Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: colorScheme.surface.withValues(alpha: 0.8),
                  border: Border.all(
                    color: colorScheme.outline.withValues(alpha: 0.2),
                  ),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite
                      ? colorScheme.primary
                      : colorScheme.onSurface,
                  size: 20.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
