import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loni_africa/core/utilities/validators.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/auth/presentation/provider/auth_provider.dart';
import 'package:loni_africa/features/auth/presentation/screens/otp_verification_screen.dart';
import 'package:loni_africa/features/discovery/presentation/screens/home_screen.dart';
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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String path = '/login';
  static const String name = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _onSignIn() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final authProvider = context.read<AuthProvider>();
    final result = await authProvider.signInWithPassword(
      identifier: _emailController.text,
      password: _passwordController.text,
    );

    if (!mounted) return;

    if (result.isSuccess) {
      GlobalSnackBar.showSuccess(result.message ?? context.l10n.success);
      context.go(HomeScreen.path);
    } else {
      GlobalSnackBar.showError(result.message ?? context.l10n.error);
    }
  }

  void _onGoogleSignIn() {
    // TODO: Implement Google sign in
  }

  Future<void> _onPhoneSignIn() async {
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

  void _onForgotPassword() {
    // TODO: Navigate to forgot password
  }

  void _onSignUp() {
    // TODO: Navigate to sign up
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
                      title: context.l10n.welcomeBack,
                      subtitle: context.l10n.signInSubtitle,
                      showBackButton: true,
                      trailingWidget: ThemeToggleButton(
                        onToggle: themeNotifier.onToggle,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    AuthTextField(
                      label: context.l10n.emailLabel,
                      hintText: context.l10n.enterEmail,
                      prefixIcon: Icons.email_outlined,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: Validators.validateEmailOrPhone,
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
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 20.w,
                              height: 20.h,
                              child: Checkbox(
                                value: _rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value ?? false;
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              context.l10n.rememberMe,
                              style: textTheme.bodySmall?.copyWith(
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: _onForgotPassword,
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            context.l10n.forgotPassword,
                            style: textTheme.bodySmall?.copyWith(
                              fontSize: 14.sp,
                              color: colorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32.h),
                    PrimaryButton(
                      text: context.l10n.signIn,
                      onPressed: () => _onSignIn(),
                      isLoading: authProvider.isSigningIn,
                    ),
                    SizedBox(height: 24.h),
                    DividerWithText(text: context.l10n.orContinueWith),
                    SizedBox(height: 24.h),
                    SocialLoginRow(
                      onGooglePressed: _onGoogleSignIn,
                      onPhonePressed: _onPhoneSignIn,
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
                            context.l10n.dontHaveAccount,
                            style: textTheme.bodySmall?.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                          TextButton(
                            onPressed: _onSignUp,
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              context.l10n.signUp,
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
