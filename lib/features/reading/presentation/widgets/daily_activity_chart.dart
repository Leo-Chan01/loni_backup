import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DailyActivityChart extends StatelessWidget {
  final Map<String, double> dailyActivity;

  const DailyActivityChart({super.key, required this.dailyActivity});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final maxValue = dailyActivity.values.reduce((a, b) => a > b ? a : b);
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

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
          Text(
            'Daily Activity',
            style: textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            height: 160.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: days.map((day) {
                final value = dailyActivity[day] ?? 0;
                final heightPercent = maxValue > 0 ? value / maxValue : 0;
                final isToday = day == 'Sun';

                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: (heightPercent * 120).h,
                          decoration: BoxDecoration(
                            color: isToday
                                ? colorScheme.primary
                                : colorScheme.primary.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(4.r),
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          day,
                          style: textTheme.bodySmall?.copyWith(
                            color: isToday
                                ? colorScheme.primary
                                : colorScheme.onSurfaceVariant,
                            fontWeight: isToday
                                ? FontWeight.bold
                                : FontWeight.normal,
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
