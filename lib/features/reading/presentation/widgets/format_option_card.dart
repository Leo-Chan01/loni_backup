import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormatOptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String price;
  final bool isSelected;
  final VoidCallback onTap;

  const FormatOptionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.price,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          border: Border.all(
            color: isSelected
                ? colorScheme.primary
                : colorScheme.outline.withValues(alpha: 0.2),
            width: isSelected ? 2.w : 1.w,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: isSelected
                    ? colorScheme.primary.withValues(alpha: 0.1)
                    : colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                icon,
                color: isSelected
                    ? colorScheme.primary
                    : colorScheme.onSurfaceVariant,
                size: 24.sp,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              price,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: isSelected ? colorScheme.primary : colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
