import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(
          child: Divider(
            color: colorScheme.onSurface.withValues(alpha: 0.1),
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            text.toUpperCase(),
            style: textTheme.labelSmall?.copyWith(
              fontSize: 10.sp,
              letterSpacing: 1.5,
              color: colorScheme.onSurface.withValues(alpha: 0.5),
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: colorScheme.onSurface.withValues(alpha: 0.1),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
