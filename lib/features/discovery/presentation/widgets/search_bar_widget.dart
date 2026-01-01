import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback? onSearch;
  final VoidCallback? onClear;

  const SearchBarWidget({
    super.key,
    required this.controller,
    this.hintText = 'Search books, authors...',
    this.onSearch,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: colorScheme.onSurface.withValues(alpha: 0.5),
          fontSize: 14.sp,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: HugeIcon(
            icon: HugeIcons.strokeRoundedSearch01,
            color: colorScheme.onSurface.withValues(alpha: 0.6),
            size: 20.sp,
          ),
        ),
        suffixIcon: controller.text.isNotEmpty
            ? GestureDetector(
                onTap: () {
                  controller.clear();
                  onClear?.call();
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: HugeIcon(
                    icon: HugeIcons.strokeRoundedCancel01,
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                    size: 20.sp,
                  ),
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.3),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.3),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: colorScheme.primary,
            width: 2.w,
          ),
        ),
        filled: true,
        fillColor: colorScheme.surfaceContainer,
        contentPadding: EdgeInsets.symmetric(vertical: 12.h),
      ),
      onSubmitted: (_) => onSearch?.call(),
    );
  }
}
