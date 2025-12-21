import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontSizeControl extends StatelessWidget {
  final double fontSize;
  final ValueChanged<double> onChanged;

  const FontSizeControl({
    super.key,
    required this.fontSize,
    required this.onChanged,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  if (fontSize > 12) {
                    onChanged((fontSize - 2).clamp(12, 24));
                  }
                },
                child: Container(
                  width: 48.w,
                  height: 48.w,
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: Text(
                      'A-',
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                'Aa',
                style: TextStyle(
                  fontFamily: 'Merriweather',
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize.sp,
                  color: colorScheme.onSurface,
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (fontSize < 24) {
                    onChanged((fontSize + 2).clamp(12, 24));
                  }
                },
                child: Container(
                  width: 48.w,
                  height: 48.w,
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: Text(
                      'A+',
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 4.h,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.r),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 16.r),
            ),
            child: Slider(
              value: fontSize,
              min: 12,
              max: 24,
              divisions: 6,
              activeColor: colorScheme.primary,
              inactiveColor: colorScheme.surfaceContainerHighest,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
