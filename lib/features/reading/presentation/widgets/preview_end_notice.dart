import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/shared/widgets/primary_button.dart';

class PreviewEndNotice extends StatelessWidget {
  final int totalPages;
  final String price;
  final Future<void> Function() onBuyPressed;

  const PreviewEndNotice({
    super.key,
    required this.totalPages,
    required this.price,
    required this.onBuyPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.2)),
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.all(20.w),
      child: Column(
        children: [
          Icon(Icons.lock, color: colorScheme.primary, size: 48.sp),
          SizedBox(height: 12.h),
          Text(
            context.l10n.previewEndsHere,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            context.l10n.purchaseFullBook(totalPages),
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.h),
          PrimaryButton(
            text: context.l10n.buyFor(price),
            onPressed: onBuyPressed,
          ),
        ],
      ),
    );
  }
}
