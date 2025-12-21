import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';

class PreviewBanner extends StatelessWidget {
  final VoidCallback onBuyPressed;

  const PreviewBanner({super.key, required this.onBuyPressed});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(alpha: 0.9),
      ),
      child: Row(
        children: [
          Icon(Icons.visibility, color: Colors.white, size: 18.sp),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              '${context.l10n.previewMode} • ${context.l10n.limitedPages}',
              style: textTheme.bodySmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          GestureDetector(
            onTap: onBuyPressed,
            child: Text(
              context.l10n.buyFullBook,
              style: textTheme.bodySmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
