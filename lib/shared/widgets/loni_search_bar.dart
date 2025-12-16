import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

class LoniSearchBar extends StatelessWidget {
  const LoniSearchBar({
    super.key,
    this.hintText = 'Search books, authors, genres',
    this.onChanged,
    this.onSubmitted,
    this.onFilterTap,
  });

  final String hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onFilterTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.6),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        children: [
          HugeIcon(
            icon: HugeIcons.strokeRoundedSearch01,
            color: colorScheme.onSurfaceVariant,
            size: 22.sp,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              onSubmitted: onSubmitted,
              cursorColor: colorScheme.primary,
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurface,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
          if (onFilterTap != null) ...[
            SizedBox(width: 8.w),
            InkWell(
              onTap: onFilterTap,
              borderRadius: BorderRadius.circular(12.r),
              child: Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedFilterHorizontal,
                  color: colorScheme.primary,
                  size: 20.sp,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
