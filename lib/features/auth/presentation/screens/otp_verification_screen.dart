import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loni_africa/features/auth/data/services/auth_service.dart';
import 'package:loni_africa/main.dart';
import 'package:loni_africa/shared/widgets/global_snackbar.dart';
import 'package:loni_africa/shared/widgets/otp_input_row.dart';
import 'package:loni_africa/shared/widgets/primary_button.dart';
import 'package:loni_africa/shared/widgets/resend_code_button.dart';
import 'package:loni_africa/shared/widgets/screen_header.dart';
import 'package:loni_africa/shared/widgets/texture_overlay.dart';
import 'package:loni_africa/shared/widgets/theme_toggle_button.dart';

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
  final _authService = AuthService();
  final GlobalKey<OtpInputRowState> _otpKey = GlobalKey<OtpInputRowState>();
  String _otp = '';
  bool _isLoading = false;

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

  Future<void> _handleVerify() async {
    setState(() {
      _isLoading = true;
    });

    final result = await _authService.verifyOtp(
      otp: _otp,
      emailOrPhone: widget.email ?? widget.phoneNumber ?? '',
    );

    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });

    if (result.isSuccess) {
      GlobalSnackBar.showSuccess(result.message);
      context.go('/dashboard');
    } else {
      GlobalSnackBar.showError(result.message);
    }
  }

  void _handleResendCode() async {
    final result = await _authService.resendOtp(
      emailOrPhone: widget.email ?? widget.phoneNumber ?? '',
    );

    if (!mounted) return;

    if (result.isSuccess) {
      GlobalSnackBar.showInfo(result.message);
      _otpKey.currentState?.clear();
      setState(() {
        _otp = '';
      });
    } else {
      GlobalSnackBar.showError(result.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final themeNotifier = ThemeNotifier.of(context);

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
                    title: 'Verify Your Account',
                    subtitle: 'Enter the 6-digit code sent to $_maskedContact',
                    showBackButton: true,
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
                    text: 'Verify & Continue',
                    onPressed: _otp.length == 6 ? _handleVerify : null,
                    isLoading: _isLoading,
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
