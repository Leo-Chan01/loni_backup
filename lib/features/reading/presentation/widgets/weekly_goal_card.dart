import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';

class WeeklyGoalCard extends StatelessWidget {
  final double currentHours;
  final double goalHours;
  final VoidCallback onEdit;

  const WeeklyGoalCard({
    super.key,
    required this.currentHours,
    required this.goalHours,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final percent = (currentHours / goalHours * 100).clamp(0, 100);
    final hoursLeft = (goalHours - currentHours).clamp(0, goalHours);

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.weeklyGoal,
                style: textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
              GestureDetector(
                onTap: onEdit,
                child: Text(
                  context.l10n.edit,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${currentHours.toStringAsFixed(1)} / ${goalHours.toInt()} ${context.l10n.hours('')}',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                '${percent.toInt()}%',
                style: textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Container(
            height: 12.h,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: percent / 100,
              child: Container(
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            context.l10n.hoursLeft(hoursLeft.toStringAsFixed(1)),
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
