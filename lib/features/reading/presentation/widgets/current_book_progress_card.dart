import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loni_africa/features/reading/domain/models/reading_progress_model.dart';

class CurrentBookProgressCard extends StatelessWidget {
  final String coverImageUrl;
  final String title;
  final String author;
  final ReadingProgressModel progress;

  const CurrentBookProgressCard({
    super.key,
    required this.coverImageUrl,
    required this.title,
    required this.author,
    required this.progress,
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
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.network(
                  coverImageUrl,
                  width: 64.w,
                  height: 80.h,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 64.w,
                      height: 80.h,
                      color: colorScheme.surfaceContainerHighest,
                      child: Icon(
                        Icons.book,
                        size: 30.sp,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      author,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 8.h,
                            decoration: BoxDecoration(
                              color: colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: progress.progressPercent / 100,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: colorScheme.primary,
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          '${progress.progressPercent.toInt()}%',
                          style: textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: _StatItem(
                  value: progress.pagesRead.toString(),
                  label: 'Pages Read',
                ),
              ),
              Expanded(
                child: _StatItem(
                  value: progress.pagesLeft.toString(),
                  label: 'Pages Left',
                ),
              ),
              Expanded(
                child: _StatItem(value: progress.timeLeft, label: 'Time Left'),
              ),
            ],
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
