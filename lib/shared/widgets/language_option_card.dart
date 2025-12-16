import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageOptionCard extends StatelessWidget {
  const LanguageOptionCard({
    super.key,
    required this.languageName,
    required this.languageSubtitle,
    required this.isSelected,
    required this.onTap,
  });

  final String languageName;
  final String languageSubtitle;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          border: Border.all(
            color: isSelected
                ? colorScheme.primary
                : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    languageName,
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    languageSubtitle,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),
            _buildSelectionIndicator(colorScheme),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectionIndicator(ColorScheme colorScheme) {
    return Container(
      width: 24.w,
      height: 24.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? colorScheme.primary : Colors.transparent,
        border: Border.all(
          color: isSelected
              ? colorScheme.primary
              : colorScheme.onSurface.withValues(alpha: 0.2),
          width: 2,
        ),
      ),
      child: isSelected
          ? Icon(
              Icons.check,
              size: 14.sp,
              color: colorScheme.onPrimary,
            )
          : null,
    );
  }
}
