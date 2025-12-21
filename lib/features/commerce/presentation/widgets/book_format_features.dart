import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookFormatFeatures extends StatelessWidget {
  final List<String> features;
  final Color iconColor;

  const BookFormatFeatures({
    super.key,
    required this.features,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12.r),
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: List.generate(
          features.length,
          (index) => Padding(
            padding: EdgeInsets.only(
              bottom: index < features.length - 1 ? 8.h : 0,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.check,
                  color: iconColor,
                  size: 16.sp,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    features[index],
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
