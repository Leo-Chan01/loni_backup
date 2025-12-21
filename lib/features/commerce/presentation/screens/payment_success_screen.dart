import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/shared/widgets/primary_button.dart';
import 'package:loni_africa/shared/widgets/secondary_button.dart';

class PaymentSuccessScreen extends StatelessWidget {
  static const String path = '/payment-success/:bookId';
  static const String name = 'PaymentSuccessScreen';

  final String bookId;

  const PaymentSuccessScreen({
    super.key,
    required this.bookId,
  });

  // Mock data
  static const String _bookTitle = 'Things Fall Apart';
  static const double _amountPaid = 10.49;
  static const String _transactionId = 'TXN-2024-12345';
  static const String _date = '15 March 2024, 14:30';

  Future<void> _handleStartReading(BuildContext context) async {
    // Navigate to library or reader screen
    context.go('/library');
  }

  Future<void> _handleViewReceipt(BuildContext context) async {
    // Open receipt view or download
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 80.h),
                    Container(
                      width: 120.w,
                      height: 120.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green.withValues(alpha: 0.1),
                      ),
                      child: Center(
                        child: Container(
                          width: 100.w,
                          height: 100.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.check_rounded,
                            color: Colors.white,
                            size: 56.sp,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    Text(
                      context.l10n.paymentSuccessful,
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      context.l10n.bookAddedToLibrary,
                      style: textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 48.h),
                    Container(
                      padding: EdgeInsets.all(24.w),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              _bookTitle,
                              style: textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Merriweather',
                                color: colorScheme.onSurface,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Divider(
                            color: colorScheme.outline.withValues(alpha: 0.2),
                            height: 1.h,
                          ),
                          SizedBox(height: 24.h),
                          _buildDetailRow(
                            context.l10n.amountPaid,
                            '\$${_amountPaid.toStringAsFixed(2)}',
                            colorScheme,
                            textTheme,
                          ),
                          SizedBox(height: 20.h),
                          _buildDetailRow(
                            context.l10n.transactionId,
                            _transactionId,
                            colorScheme,
                            textTheme,
                          ),
                          SizedBox(height: 20.h),
                          _buildDetailRow(
                            context.l10n.date,
                            _date,
                            colorScheme,
                            textTheme,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: colorScheme.surface.withValues(alpha: 0.95),
                border: Border(
                  top: BorderSide(
                    color: colorScheme.outline.withValues(alpha: 0.2),
                  ),
                ),
              ),
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 16.h),
              child: Column(
                children: [
                  PrimaryButton(
                    text: context.l10n.startReading,
                    onPressed: () => _handleStartReading(context),
                  ),
                  SizedBox(height: 12.h),
                  SecondaryButton(
                    text: context.l10n.viewReceipt,
                    onPressed: () => _handleViewReceipt(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(
    String label,
    String value,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Text(
            value,
            style: textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
