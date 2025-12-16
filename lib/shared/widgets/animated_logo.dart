import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({
    super.key,
    required this.animation,
    required this.scaleAnimation,
    this.size = 112,
    this.iconSize = 56,
  });

  final Animation<double> animation;
  final Animation<double> scaleAnimation;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Pulse glow effect
            Container(
              width: (size + 28).w,
              height: (size + 28).h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    colorScheme.primary.withValues(alpha: 0.2),
                    colorScheme.primary.withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),

            // Logo circle
            Container(
              width: size.w,
              height: size.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: colorScheme.primary.withValues(alpha: 0.3),
                  width: 2,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.menu_book_rounded,
                  size: iconSize.sp,
                  color: colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
