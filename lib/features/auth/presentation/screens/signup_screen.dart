import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loni_africa/core/utilities/validators.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/auth/presentation/provider/auth_provider.dart';
import 'package:loni_africa/features/auth/presentation/screens/otp_verification_screen.dart';
import 'package:loni_africa/main.dart';
import 'package:loni_africa/shared/widgets/auth_text_field.dart';
import 'package:loni_africa/shared/widgets/divider_with_text.dart';
import 'package:loni_africa/shared/widgets/global_snackbar.dart';
import 'package:loni_africa/shared/widgets/primary_button.dart';
import 'package:loni_africa/shared/widgets/screen_header.dart';
import 'package:loni_africa/shared/widgets/social_login_row.dart';
import 'package:loni_africa/shared/widgets/texture_overlay.dart';
import 'package:loni_africa/shared/widgets/theme_toggle_button.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String path = '/signup';
  static const String name = 'SignUpScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _agreeToTerms = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _onSignUp() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (!_agreeToTerms) {
      GlobalSnackBar.showError(context.l10n.agreeToTermsError);
      return;
    }

    final authProvider = context.read<AuthProvider>();
    final result = await authProvider.signUpWithPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text,
      fullName: _nameController.text.trim(),
    );

    if (!mounted) return;

    if (result.isSuccess) {
      GlobalSnackBar.showSuccess(result.message ?? context.l10n.success);
      context.go('${OtpVerificationScreen.path}?email=${_emailController.text.trim()}');
    } else {
      GlobalSnackBar.showError(result.message ?? context.l10n.error);
    }
  }

  void _onGoogleSignUp() {
    // TODO: Implement Google sign up
  }

  Future<void> _onPhoneSignUp() async {
    final identifier = _emailController.text.trim();
    final validationError = Validators.validateEmailOrPhone(identifier);
    if (validationError != null) {
      GlobalSnackBar.showError(validationError);
      return;
    }

    final authProvider = context.read<AuthProvider>();
    if (authProvider.isSendingOtp) return;
    final result = await authProvider.sendOtp(identifier: identifier);

    if (!mounted) return;

    if (result.isSuccess) {
      GlobalSnackBar.showInfo(context.l10n.verificationCodeSent(identifier));
      context.go('${OtpVerificationScreen.path}?email=$identifier');
    } else {
      GlobalSnackBar.showError(result.message ?? context.l10n.error);
    }
  }

  void _onSignIn() {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
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
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),
                    ScreenHeader(
                      title: context.l10n.createAccount,
                      subtitle: context.l10n.signUpSubtitle,
                      showBackButton: true,
                      trailingWidget: ThemeToggleButton(
                        onToggle: themeNotifier.onToggle,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    AuthTextField(
                      label: context.l10n.nameLabel,
                      hintText: context.l10n.enterName,
                      prefixIcon: Icons.person_outline,
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      validator: Validators.validateName,
                    ),
                    SizedBox(height: 20.h),
                    AuthTextField(
                      label: context.l10n.emailLabel,
                      hintText: context.l10n.enterEmail,
                      prefixIcon: Icons.email_outlined,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: Validators.validateEmail,
                    ),
                    SizedBox(height: 20.h),
                    AuthTextField(
                      label: context.l10n.passwordLabel,
                      hintText: context.l10n.enterPassword,
                      prefixIcon: Icons.lock_outline,
                      controller: _passwordController,
                      isPassword: !_isPasswordVisible,
                      validator: Validators.validatePassword,
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
                      label: context.l10n.passwordLabel,
                      hintText: context.l10n.enterPassword,
                      prefixIcon: Icons.lock_outline,
                      controller: _confirmPasswordController,
                      isPassword: !_isConfirmPasswordVisible,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return context.l10n.passwordRequired;
                        }
                        if (value != _passwordController.text) {
                          return context.l10n.passwordsDoNotMatch;
                        }
                        return null;
                      },
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
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: Checkbox(
                            value: _agreeToTerms,
                            onChanged: (value) {
                              setState(() {
                                _agreeToTerms = value ?? false;
                              });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            context.l10n.authTermsNotice(
                              context.l10n.termsOfService,
                              context.l10n.privacyPolicy,
                            ),
                            style: textTheme.bodySmall?.copyWith(
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32.h),
                    PrimaryButton(
                      text: context.l10n.signUp,
                      onPressed: () => _onSignUp(),
                      isLoading: authProvider.isSigningUp,
                    ),
                    SizedBox(height: 24.h),
                    DividerWithText(text: context.l10n.orContinueWith),
                    SizedBox(height: 24.h),
                    SocialLoginRow(
                      onGooglePressed: _onGoogleSignUp,
                      onPhonePressed: _onPhoneSignUp,
                      googleLabel: context.l10n.google,
                      phoneLabel: context.l10n.phoneLabel,
                      isPhoneLoading: authProvider.isSendingOtp,
                    ),
                    SizedBox(height: 32.h),
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            context.l10n.alreadyHaveAccount,
                            style: textTheme.bodySmall?.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                          TextButton(
                            onPressed: _onSignIn,
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              context.l10n.signIn,
                              style: textTheme.bodySmall?.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: colorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Center(
                      child: Text(
                        context.l10n.authTermsNotice(
                          context.l10n.termsOfService,
                          context.l10n.privacyPolicy,
                        ),
                        textAlign: TextAlign.center,
                        style: textTheme.labelSmall?.copyWith(
                          fontSize: 10.sp,
                          color: colorScheme.onSurface.withValues(alpha: 0.4),
                          height: 1.5,
                        ),
                      ),
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
