import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/shared/widgets/secondary_button.dart';
import 'package:loni_africa/shared/widgets/screen_header.dart';

class PaymentPendingScreen extends StatefulWidget {
  static const String path = '/payment-pending/:bookId';
  static const String name = 'PaymentPendingScreen';

  final String bookId;

  const PaymentPendingScreen({super.key, required this.bookId});

  @override
  State<PaymentPendingScreen> createState() => _PaymentPendingScreenState();
}

class _PaymentPendingScreenState extends State<PaymentPendingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  // Mock data
  final String _provider = 'MTN Mobile Money';
  final double _amount = 10.49;
  final String _phoneNumber = '+237 6XX XXX XXX';
  final String _reference = 'TFA-2024-001';

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _handleCancel() async {
    context.pop();
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ScreenHeader(
                title: context.l10n.processingPayment,
                subtitle: '',
                showBackButton: false,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 48.h),
                    RotationTransition(
                      turns: _animationController,
                      child: Container(
                        width: 120.w,
                        height: 120.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [colorScheme.primary, colorScheme.tertiary],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: 100.w,
                            height: 100.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colorScheme.surface,
                            ),
                            child: Icon(
                              Icons.phonelink_ring,
                              color: colorScheme.primary,
                              size: 48.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    Text(
                      context.l10n.checkPhoneApprove(_provider),
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 48.h),
                    Container(
                      padding: EdgeInsets.all(24.w),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest.withValues(
                          alpha: 0.3,
                        ),
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Column(
                        children: [
                          _buildDetailRow(
                            context.l10n.amount,
                            '\$${_amount.toStringAsFixed(2)}',
                            colorScheme,
                            textTheme,
                          ),
                          SizedBox(height: 20.h),
                          Divider(
                            color: colorScheme.outline.withValues(alpha: 0.2),
                            height: 1.h,
                          ),
                          SizedBox(height: 20.h),
                          _buildDetailRow(
                            context.l10n.phoneNumber,
                            _phoneNumber,
                            colorScheme,
                            textTheme,
                          ),
                          SizedBox(height: 20.h),
                          Divider(
                            color: colorScheme.outline.withValues(alpha: 0.2),
                            height: 1.h,
                          ),
                          SizedBox(height: 20.h),
                          _buildDetailRow(
                            context.l10n.reference,
                            _reference,
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
              child: SecondaryButton(
                text: context.l10n.cancelPayment,
                onPressed: _handleCancel,
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
      children: [
        Text(
          label,
          style: textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        Text(
          value,
          style: textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
