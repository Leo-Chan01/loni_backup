import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

class TrendingBookItem extends StatelessWidget {
  const TrendingBookItem({
    super.key,
    required this.rank,
    required this.title,
    required this.author,
    required this.price,
    required this.imageUrl,
    required this.trendChange,
    this.onTap,
    this.onAuthorTap,
  });

  final int rank;
  final String title;
  final String author;
  final String price;
  final String imageUrl;
  final String trendChange;
  final VoidCallback? onTap;
  final VoidCallback? onAuthorTap;

  Color _getRankColor() {
    switch (rank) {
      case 1:
        return const Color(0xFFEAB308); // Gold
      case 2:
        return const Color(0xFF9CA3AF); // Silver
      case 3:
        return const Color(0xFFF97316); // Bronze
      default:
        return const Color(0xFF6B7280); // Gray
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final rankColor = _getRankColor();
    final isUpTrend = trendChange.startsWith('+');
    final isDownTrend = trendChange.startsWith('-');

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.15),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [rankColor, rankColor.withValues(alpha: 0.7)],
                ),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '$rank',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Container(
                width: 48.w,
                height: 64.h,
                color: colorScheme.surfaceContainer,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Center(
                    child: HugeIcon(
                      icon: HugeIcons.strokeRoundedImageNotFound01,
                      color: colorScheme.onSurfaceVariant,
                      size: 20.sp,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  GestureDetector(
                    onTap: onAuthorTap,
                    child: Text(
                      author,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        decoration: onAuthorTap != null
                            ? TextDecoration.underline
                            : null,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      if (isUpTrend)
                        HugeIcon(
                          icon: HugeIcons.strokeRoundedArrowUp01,
                          color: const Color(0xFF10B981),
                          size: 12.sp,
                        )
                      else if (isDownTrend)
                        HugeIcon(
                          icon: HugeIcons.strokeRoundedArrowDown01,
                          color: const Color(0xFFEF4444),
                          size: 12.sp,
                        )
                      else
                        HugeIcon(
                          icon: HugeIcons.strokeRoundedRemove01,
                          color: const Color(0xFF6B7280),
                          size: 12.sp,
                        ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: Text(
                          trendChange,
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(color: colorScheme.onSurfaceVariant),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              price,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
