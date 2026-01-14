import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import 'package:loni_africa/core/utilities/localization_extension.dart';

class ReaderSessionsSummary extends StatelessWidget {
  final bool isLoading;
  final String? error;
  final int sessionsCount;
  final Duration totalDuration;
  final Color textColor;

  const ReaderSessionsSummary({
    super.key,
    required this.isLoading,
    required this.error,
    required this.sessionsCount,
    required this.totalDuration,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (isLoading) {
      return Center(
        child: SizedBox(
          width: 18.w,
          height: 18.w,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: colorScheme.primary,
          ),
        ),
      );
    }

    if (error != null) {
      return Text(
        context.l10n.error,
        style: textTheme.bodySmall?.copyWith(color: colorScheme.error),
      );
    }

    if (sessionsCount <= 0) {
      return Text(
        context.l10n.noReadingSessionsYet,
        style: textTheme.bodySmall?.copyWith(
          color: textColor.withValues(alpha: 0.7),
        ),
      );
    }

    final totalMinutes = totalDuration.inMinutes;
    final totalHours = totalDuration.inHours;

    final readingTimeLabel = context.l10n.readingTime;
    final readingTimeValue = totalHours >= 1
        ? context.l10n.hours(totalHours.toString())
        : context.l10n.minutes(totalMinutes.toString());

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          HugeIcon(
            icon: HugeIcons.strokeRoundedClock01,
            color: textColor,
            size: 18.sp,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  readingTimeLabel,
                  style: textTheme.bodySmall?.copyWith(
                    color: textColor.withValues(alpha: 0.7),
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  readingTimeValue,
                  style: textTheme.titleSmall?.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                context.l10n.readingSessions,
                style: textTheme.bodySmall?.copyWith(
                  color: textColor.withValues(alpha: 0.7),
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                sessionsCount.toString(),
                style: textTheme.titleSmall?.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
