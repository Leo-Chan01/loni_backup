import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookStatsCard extends StatelessWidget {
  final int pages;
  final String genre;
  final String publishedYear;

  const BookStatsCard({
    super.key,
    required this.pages,
    required this.genre,
    required this.publishedYear,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.2)),
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.all(20.w),
      child: Row(
        children: [
          Expanded(
            child: _StatItem(value: pages.toString(), label: 'Pages'),
          ),
          Container(
            width: 1.w,
            height: 40.h,
            color: colorScheme.outline.withValues(alpha: 0.1),
          ),
          Expanded(
            child: _StatItem(value: genre, label: 'Genre'),
          ),
          Container(
            width: 1.w,
            height: 40.h,
            color: colorScheme.outline.withValues(alpha: 0.1),
          ),
          Expanded(
            child: _StatItem(value: publishedYear, label: 'Published'),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Text(
          value,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
