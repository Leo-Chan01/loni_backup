import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialLoginRow extends StatelessWidget {
  const SocialLoginRow({
    super.key,
    required this.onGooglePressed,
    required this.googleLabel,
    this.onPhonePressed,
    this.phoneLabel,
    this.isGoogleLoading = false,
    this.isPhoneLoading = false,
  });

  final VoidCallback onGooglePressed;
  final VoidCallback? onPhonePressed;
  final String googleLabel;
  final String? phoneLabel;
  final bool isGoogleLoading;
  final bool isPhoneLoading;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final showPhone =
        onPhonePressed != null && (phoneLabel?.isNotEmpty ?? false);

    return Row(
      children: [
        Expanded(
          child: _SocialButton(
            icon: Icons.g_mobiledata_rounded,
            label: googleLabel,
            onPressed: onGooglePressed,
            isLoading: isGoogleLoading,
            colorScheme: colorScheme,
            textTheme: textTheme,
          ),
        ),
        if (showPhone) ...[
          SizedBox(width: 12.w),
          Expanded(
            child: _SocialButton(
              icon: Icons.phone_android_rounded,
              label: phoneLabel!,
              onPressed: onPhonePressed!,
              isLoading: isPhoneLoading,
              colorScheme: colorScheme,
              textTheme: textTheme,
            ),
          ),
        ],
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
    this.isLoading = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final ColorScheme colorScheme;
  final TextTheme textTheme;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colorScheme.onSurface.withValues(alpha: 0.1)),
      ),
      child: InkWell(
        onTap: isLoading ? null : onPressed,
        borderRadius: BorderRadius.circular(12.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              SizedBox(
                width: 20.w,
                height: 20.h,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              )
            else ...[
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
          ],
        ),
      ),
    );
  }
}
