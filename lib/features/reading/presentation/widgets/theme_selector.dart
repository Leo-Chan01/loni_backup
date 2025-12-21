import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loni_africa/features/reading/domain/models/reader_settings_model.dart';

class ThemeSelector extends StatelessWidget {
  final ReaderTheme selectedTheme;
  final ValueChanged<ReaderTheme> onThemeChanged;

  const ThemeSelector({
    super.key,
    required this.selectedTheme,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ThemeOption(
            label: 'Dark',
            backgroundColor: const Color(0xFF0B0B0C),
            borderColor: Colors.grey[700]!,
            textColor: Colors.white,
            isSelected: selectedTheme == ReaderTheme.dark,
            onTap: () => onThemeChanged(ReaderTheme.dark),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: _ThemeOption(
            label: 'Light',
            backgroundColor: Colors.white,
            borderColor: Colors.grey[300]!,
            textColor: Colors.grey[900]!,
            isSelected: selectedTheme == ReaderTheme.light,
            onTap: () => onThemeChanged(ReaderTheme.light),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: _ThemeOption(
            label: 'Sepia',
            backgroundColor: const Color(0xFFF4ECD8),
            borderColor: const Color(0xFFE5D5B7),
            textColor: Colors.grey[800]!,
            isSelected: selectedTheme == ReaderTheme.sepia,
            onTap: () => onThemeChanged(ReaderTheme.sepia),
          ),
        ),
      ],
    );
  }
}

class _ThemeOption extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final bool isSelected;
  final VoidCallback onTap;

  const _ThemeOption({
    required this.label,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? colorScheme.primary
                : colorScheme.outline.withValues(alpha: 0.2),
            width: isSelected ? 2.w : 1.w,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            Container(
              width: 56.w,
              height: 56.w,
              decoration: BoxDecoration(
                color: backgroundColor,
                border: Border.all(color: borderColor),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Text(
                  'Aa',
                  style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 14.sp,
                    color: textColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              label,
              style: textTheme.bodySmall?.copyWith(
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
