import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/auth/presentation/provider/auth_provider.dart';
import 'package:loni_africa/features/discovery/presentation/screens/home_screen.dart';
import 'package:loni_africa/main.dart';
import 'package:loni_africa/shared/widgets/global_snackbar.dart';
import 'package:loni_africa/shared/widgets/otp_input_row.dart';
import 'package:loni_africa/shared/widgets/primary_button.dart';
import 'package:loni_africa/shared/widgets/resend_code_button.dart';
import 'package:loni_africa/shared/widgets/screen_header.dart';
import 'package:loni_africa/shared/widgets/texture_overlay.dart';
import 'package:loni_africa/shared/widgets/theme_toggle_button.dart';
import 'package:provider/provider.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, this.email, this.phoneNumber});

  final String? email;
  final String? phoneNumber;

  static const String path = '/otp-verification';
  static const String name = 'otp-verification';

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final GlobalKey<OtpInputRowState> _otpKey = GlobalKey<OtpInputRowState>();
  String _otp = '';

  String get _maskedContact {
    if (widget.email != null) {
      final parts = widget.email!.split('@');
      if (parts.length == 2) {
        final username = parts[0];
        final domain = parts[1];
        if (username.length > 2) {
          return '${username.substring(0, 2)}${'*' * (username.length - 2)}@$domain';
        }
        return widget.email!;
      }
    } else if (widget.phoneNumber != null) {
      final phone = widget.phoneNumber!;
      if (phone.length > 4) {
        return '${phone.substring(0, 4)}${'*' * (phone.length - 4)}';
      }
      return phone;
    }
    return '';
  }

  void _handleOtpChanged(String otp) {
    setState(() {
      _otp = otp;
    });
  }

  void _handleOtpCompleted(String otp) {
    setState(() {
      _otp = otp;
    });
  }

  Future<void> _handleBack() async {
    // Clear the pending OTP verification when user goes back
    final authProvider = context.read<AuthProvider>();
    authProvider.clearPendingOtpVerification();
    if (!mounted) return;
    context.pop();
  }

  Future<void> _handleVerify() async {
    final identifier = widget.email ?? widget.phoneNumber ?? '';
    if (identifier.isEmpty) {
      GlobalSnackBar.showError(context.l10n.error);
      return;
    }

    final authProvider = context.read<AuthProvider>();
    if (authProvider.isVerifyingOtp) return;

    final result = await authProvider.verifyOtp(
      identifier: identifier,
      otpCode: _otp,
    );

    if (!mounted) return;

    if (result.isSuccess) {
      GlobalSnackBar.showSuccess(result.message ?? context.l10n.success);
      context.go(HomeScreen.path);
    } else {
      GlobalSnackBar.showError(result.message ?? context.l10n.error);
    }
  }

  void _handleResendCode() async {
    final identifier = widget.email ?? widget.phoneNumber ?? '';
    if (identifier.isEmpty) {
      GlobalSnackBar.showError(context.l10n.error);
      return;
    }

    final authProvider = context.read<AuthProvider>();
    if (authProvider.isSendingOtp) return;

    final result = await authProvider.sendOtp(identifier: identifier);

    if (!mounted) return;

    if (result.isSuccess) {
      GlobalSnackBar.showInfo(context.l10n.verificationCodeSent(identifier));
      _otpKey.currentState?.clear();
      setState(() {
        _otp = '';
      });
    } else {
      GlobalSnackBar.showError(result.message ?? context.l10n.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final themeNotifier = ThemeNotifier.of(context);
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Stack(
        children: [
          const TextureOverlay(),
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  ScreenHeader(
                    title: context.l10n.verifyYourAccount,
                    subtitle:
                        '${context.l10n.enterSixDigitCode} $_maskedContact',
                    showBackButton: true,
                    onBackPressed: _handleBack,
                    trailingWidget: ThemeToggleButton(
                      onToggle: themeNotifier.onToggle,
                    ),
                  ),
                  SizedBox(height: 48.h),

                  // OTP Input
                  OtpInputRow(
                    key: _otpKey,
                    onChanged: _handleOtpChanged,
                    onCompleted: _handleOtpCompleted,
                  ),

                  SizedBox(height: 32.h),

                  // Resend Code Button
                  ResendCodeButton(
                    onResend: _handleResendCode,
                    initialCountdown: 60,
                  ),

                  SizedBox(height: 48.h),

                  // Verify Button
                  PrimaryButton(
                    text: context.l10n.verifyAndContinue,
                    onPressed: _otp.length == 6 ? _handleVerify : null,
                    isLoading: authProvider.isVerifyingOtp,
                  ),

                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
