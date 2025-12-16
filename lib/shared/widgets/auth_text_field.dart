import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.controller,
    this.keyboardType,
  });

  final String label;
  final String hintText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: textTheme.labelSmall?.copyWith(
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
            color: colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
            color: colorScheme.surface.withValues(alpha: 0.03),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: colorScheme.onSurface.withValues(alpha: 0.1),
            ),
          ),
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            keyboardType: keyboardType,
            style: textTheme.bodyMedium?.copyWith(
              fontSize: 15.sp,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.4),
                fontSize: 15.sp,
              ),
              prefixIcon: prefixIcon != null
                  ? Icon(
                      prefixIcon,
                      color: colorScheme.onSurface.withValues(alpha: 0.4),
                      size: 20.sp,
                    )
                  : null,
              suffixIcon: suffixIcon,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
