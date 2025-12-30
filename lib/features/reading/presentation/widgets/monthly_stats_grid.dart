import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';

class MonthlyStatItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String value;
  final String label;

  const MonthlyStatItem({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.2)),
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(icon, color: iconColor, size: 24.sp),
          ),
          SizedBox(height: 12.h),
          Text(
            value,
            style: textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class MonthlyStatsGrid extends StatelessWidget {
  final int booksFinished;
  final int pagesRead;
  final double hoursRead;
  final int streak;

  const MonthlyStatsGrid({
    super.key,
    required this.booksFinished,
    required this.pagesRead,
    required this.hoursRead,
    required this.streak,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12.h,
      crossAxisSpacing: 12.w,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.1,
      children: [
        MonthlyStatItem(
          icon: Icons.menu_book_rounded,
          iconColor: colorScheme.primary,
          value: booksFinished.toString(),
          label: context.l10n.booksFinished,
        ),
        MonthlyStatItem(
          icon: Icons.auto_stories_rounded,
          iconColor: const Color(0xFFC46A3A),
          value: pagesRead.toString(),
          label: context.l10n.pagesReadLabel,
        ),
        MonthlyStatItem(
          icon: Icons.access_time_rounded,
          iconColor: colorScheme.primary,
          value: '${hoursRead.toStringAsFixed(1)}h',
          label: context.l10n.readingTimeLabel,
        ),
        MonthlyStatItem(
          icon: Icons.local_fire_department_rounded,
          iconColor: const Color(0xFFC46A3A),
          value: streak.toString(),
          label: context.l10n.dayStreak,
        ),
      ],
    );
  }
}
