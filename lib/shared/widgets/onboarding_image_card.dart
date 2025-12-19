import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingImageCard extends StatelessWidget {
  const OnboardingImageCard({
    super.key,
    required this.imageUrl,
    required this.icon,
  });

  final String imageUrl;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: 280.w, maxHeight: 280.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.r),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: colorScheme.surfaceContainerHighest,
                  child: Icon(
                    icon,
                    size: 80.sp,
                    color: colorScheme.primary.withValues(alpha: 0.3),
                  ),
                );
              },
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.3),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 24.h,
              left: 24.w,
              child: Container(
                width: 64.w,
                height: 64.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: colorScheme.primary.withValues(alpha: 0.2),
                  border: Border.all(
                    color: colorScheme.primary.withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Icon(icon, size: 32.sp, color: colorScheme.primary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
