import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialLoginRow extends StatelessWidget {
  const SocialLoginRow({
    super.key,
    required this.onGooglePressed,
    required this.onPhonePressed,
  });

  final VoidCallback onGooglePressed;
  final VoidCallback onPhonePressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(
          child: _SocialButton(
            icon: Icons.g_mobiledata_rounded,
            label: 'Google',
            onPressed: onGooglePressed,
            colorScheme: colorScheme,
            textTheme: textTheme,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: _SocialButton(
            icon: Icons.phone_android_rounded,
            label: 'Phone',
            onPressed: onPhonePressed,
            colorScheme: colorScheme,
            textTheme: textTheme,
          ),
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.colorScheme,
    required this.textTheme,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: colorScheme.onSurface.withValues(alpha: 0.1),
        ),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20.sp,
              color: colorScheme.onSurface.withValues(alpha: 0.6),
            ),
            SizedBox(width: 8.w),
            Text(
              label,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
