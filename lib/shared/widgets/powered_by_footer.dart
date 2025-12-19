import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PoweredByFooter extends StatelessWidget {
  const PoweredByFooter({super.key, required this.animation});

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Positioned(
      bottom: 48.h,
      left: 0,
      right: 0,
      child: FadeTransition(
        opacity: animation,
        child: Center(
          child: Text(
            'Powered by Loni LLC',
            style: textTheme.labelSmall?.copyWith(
              fontSize: 10.sp,
              color: colorScheme.onSurface.withValues(alpha: 0.3),
            ),
          ),
        ),
      ),
    );
  }
}
