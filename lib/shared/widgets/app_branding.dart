import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBranding extends StatelessWidget {
  const AppBranding({
    super.key,
    required this.animation,
    this.showTagline = true,
  });

  final Animation<double> animation;
  final bool showTagline;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // App name
        FadeTransition(
          opacity: animation,
          child: Text(
            'Loni',
            style: TextStyle(
              fontSize: 48.sp,
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurface,
              letterSpacing: 2,
              fontFamily: 'Merriweather',
            ),
          ),
        ),

        if (showTagline) ...[
          SizedBox(height: 12.h),

          // Tagline
          FadeTransition(
            opacity: animation,
            child: Text(
              'AFRICAN STORIES, DIGITAL FREEDOM',
              style: textTheme.labelSmall?.copyWith(
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
                color: colorScheme.onSurface.withValues(alpha: 0.6),
                letterSpacing: 3,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
