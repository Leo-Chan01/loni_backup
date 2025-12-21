import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loni_africa/features/commerce/domain/models/payment_method_model.dart';

class PaymentProviderCard extends StatelessWidget {
  final PaymentProvider provider;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentProviderCard({
    super.key,
    required this.provider,
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
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          border: Border.all(
            color: isSelected
                ? colorScheme.primary
                : colorScheme.outline.withValues(alpha: 0.2),
            width: isSelected ? 2.w : 1.w,
          ),
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Row(
          children: [
            Container(
              width: 56.w,
              height: 56.w,
              decoration: BoxDecoration(
                color: _getProviderColor(provider).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Center(
                child: Text(
                  provider.iconLetter,
                  style: textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: _getProviderColor(provider),
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    provider.displayName,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    provider.description,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            Container(
              width: 24.w,
              height: 24.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? colorScheme.primary : colorScheme.outline,
                  width: 2.w,
                ),
                color: isSelected ? colorScheme.primary : Colors.transparent,
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16.sp,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Color _getProviderColor(PaymentProvider provider) {
    switch (provider) {
      case PaymentProvider.mtn:
        return const Color(0xFFFFCC00);
      case PaymentProvider.orange:
        return const Color(0xFFFF7900);
      case PaymentProvider.airtel:
        return const Color(0xFFE30613);
      case PaymentProvider.mpesa:
        return const Color(0xFF00A65E);
      case PaymentProvider.card:
        return Colors.blue;
      case PaymentProvider.bankTransfer:
        return Colors.deepPurple;
    }
  }
}
