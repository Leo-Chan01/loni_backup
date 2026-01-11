import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/core/utilities/validators.dart';
import 'package:loni_africa/features/auth/presentation/provider/auth_provider.dart';
import 'package:loni_africa/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:loni_africa/shared/widgets/auth_text_field.dart';
import 'package:loni_africa/shared/widgets/global_snackbar.dart';
import 'package:loni_africa/shared/widgets/primary_button.dart';
import 'package:loni_africa/shared/widgets/screen_header.dart';
import 'package:loni_africa/shared/widgets/texture_overlay.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  static const String path = '/forgot-password';
  static const String name = 'ForgotPasswordScreen';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _identifierController = TextEditingController();

  @override
  void dispose() {
    _identifierController.dispose();
    super.dispose();
  }

  Future<void> _onSendResetCode() async {
    if (!_formKey.currentState!.validate()) return;

    final authProvider = context.read<AuthProvider>();
    final result = await authProvider.requestPasswordReset(
      identifier: _identifierController.text,
    );

    if (!mounted) return;

    if (result.isSuccess) {
      GlobalSnackBar.showSuccess(context.l10n.passwordResetCodeSent);
      context.push(ResetPasswordScreen.path);
    } else {
      GlobalSnackBar.showError(result.message ?? context.l10n.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Stack(
        children: [
          const TextureOverlay(),
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),
                    ScreenHeader(
                      title: context.l10n.forgotPasswordTitle,
                      subtitle: context.l10n.forgotPasswordSubtitle,
                      showBackButton: true,
                    ),
                    SizedBox(height: 40.h),
                    AuthTextField(
                      label: context.l10n.emailOrPhoneLabel,
                      hintText: context.l10n.enterEmailOrPhone,
                      prefix: Padding(
                        padding: EdgeInsets.only(left: 12.w, right: 8.w),
                        child: HugeIcon(
                          icon: HugeIcons.strokeRoundedMail01,
                          color: colorScheme.onSurface.withValues(alpha: 0.4),
                          size: 20.sp,
                        ),
                      ),
                      controller: _identifierController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) =>
                          Validators.validateEmailOrPhone(context.l10n, value),
                    ),
                    SizedBox(height: 24.h),
                    PrimaryButton(
                      text: context.l10n.sendResetCode,
                      onPressed: _onSendResetCode,
                      isLoading: authProvider.isRequestingPasswordReset,
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
