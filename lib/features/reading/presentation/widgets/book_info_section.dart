import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';

class BookInfoSection extends StatelessWidget {
  final String coverImageUrl;
  final String title;
  final String author;
  final double rating;
  final String reviewCount;

  const BookInfoSection({
    super.key,
    required this.coverImageUrl,
    required this.title,
    required this.author,
    required this.rating,
    required this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Book Cover
        Container(
          width: 112.w,
          height: 144.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: colorScheme.surface, width: 4.w),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 20.r,
                offset: Offset(0, 8.h),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.network(
              coverImageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: colorScheme.surfaceContainerHighest,
                  child: Icon(
                    Icons.book,
                    size: 40.sp,
                    color: colorScheme.onSurfaceVariant,
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(width: 16.w),

        // Book Info
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 64.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                    fontFamily: 'Merriweather',
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Text(
                  author,
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: const Color(0xFFFFB800),
                      size: 18.sp,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      rating.toStringAsFixed(1),
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      context.l10n.reviews(reviewCount),
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
