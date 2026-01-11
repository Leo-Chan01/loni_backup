import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/core/utilities/validators.dart';
import 'package:loni_africa/features/auth/presentation/provider/auth_provider.dart';
import 'package:loni_africa/features/auth/presentation/screens/login_screen.dart';
import 'package:loni_africa/shared/widgets/auth_text_field.dart';
import 'package:loni_africa/shared/widgets/global_snackbar.dart';
import 'package:loni_africa/shared/widgets/primary_button.dart';
import 'package:loni_africa/shared/widgets/screen_header.dart';
import 'package:loni_africa/shared/widgets/texture_overlay.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  static const String path = '/reset-password';
  static const String name = 'ResetPasswordScreen';

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tokenController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _tokenController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _onResetPassword() async {
    if (!_formKey.currentState!.validate()) return;

    final authProvider = context.read<AuthProvider>();
    final result = await authProvider.confirmPasswordReset(
      token: _tokenController.text,
      password: _passwordController.text,
    );

    if (!mounted) return;

    if (result.isSuccess) {
      GlobalSnackBar.showSuccess(context.l10n.passwordResetSuccess);
      context.go(LoginScreen.path);
    } else {
      GlobalSnackBar.showError(result.message ?? context.l10n.error);
    }
  }

  String? _validateToken(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.l10n.fieldRequired(context.l10n.resetTokenLabel);
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    final message = Validators.validatePassword(context.l10n, value);
    if (message != null) return message;
    if (value != _passwordController.text) {
      return context.l10n.passwordsDoNotMatch;
    }
    return null;
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
                      title: context.l10n.resetPasswordTitle,
                      subtitle: context.l10n.resetPasswordSubtitle,
                      showBackButton: true,
                    ),
                    SizedBox(height: 40.h),
                    AuthTextField(
                      label: context.l10n.resetTokenLabel,
                      hintText: context.l10n.resetTokenHint,
                      prefix: Padding(
                        padding: EdgeInsets.only(left: 12.w, right: 8.w),
                        child: HugeIcon(
                          icon: HugeIcons.strokeRoundedKey01,
                          color: colorScheme.onSurface.withValues(alpha: 0.4),
                          size: 20.sp,
                        ),
                      ),
                      controller: _tokenController,
                      keyboardType: TextInputType.text,
                      validator: _validateToken,
                    ),
                    SizedBox(height: 20.h),
                    AuthTextField(
                      label: context.l10n.newPasswordLabel,
                      hintText: context.l10n.enterPassword,
                      prefix: Padding(
                        padding: EdgeInsets.only(left: 12.w, right: 8.w),
                        child: HugeIcon(
                          icon: HugeIcons.strokeRoundedAiLock,
                          color: colorScheme.onSurface.withValues(alpha: 0.4),
                          size: 20.sp,
                        ),
                      ),
                      controller: _passwordController,
                      isPassword: !_isPasswordVisible,
                      validator: (value) =>
                          Validators.validatePassword(context.l10n, value),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: colorScheme.onSurface.withValues(alpha: 0.4),
                          size: 20.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    AuthTextField(
                      label: context.l10n.confirmPasswordLabel,
                      hintText: context.l10n.confirmPasswordHint,
                      prefix: Padding(
                        padding: EdgeInsets.only(left: 12.w, right: 8.w),
                        child: HugeIcon(
                          icon: HugeIcons.strokeRoundedAiLock,
                          color: colorScheme.onSurface.withValues(alpha: 0.4),
                          size: 20.sp,
                        ),
                      ),
                      controller: _confirmPasswordController,
                      isPassword: !_isConfirmPasswordVisible,
                      validator: _validateConfirmPassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordVisible =
                                !_isConfirmPasswordVisible;
                          });
                        },
                        icon: Icon(
                          _isConfirmPasswordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: colorScheme.onSurface.withValues(alpha: 0.4),
                          size: 20.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    PrimaryButton(
                      text: context.l10n.resetPasswordAction,
                      onPressed: _onResetPassword,
                      isLoading: authProvider.isConfirmingPasswordReset,
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
