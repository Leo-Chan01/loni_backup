import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

class ContinueReadingCard extends StatelessWidget {
  const ContinueReadingCard({
    super.key,
    required this.title,
    required this.author,
    required this.progress,
    this.onTap,
  });

  final String title;
  final String author;
  final double progress; // 0.0 - 1.0
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: colorScheme.outlineVariant.withValues(alpha: 0.5),
          ),
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow.withValues(alpha: 0.08),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 74.w,
              height: 96.h,
              decoration: BoxDecoration(
                color: colorScheme.primary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Center(
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedBookOpen01,
                  color: colorScheme.primary,
                  size: 32.sp,
                ),
              ),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w800,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    author,
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  SizedBox(height: 14.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: LinearProgressIndicator(
                      value: progress.clamp(0, 1),
                      minHeight: 10.h,
                      backgroundColor: colorScheme.surfaceContainerHighest
                          .withValues(alpha: 0.6),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        colorScheme.primary,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '${(progress * 100).round()}% completed',
                    style: textTheme.labelMedium?.copyWith(
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
  }
}
