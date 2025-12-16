import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loni_africa/main.dart';
import 'package:loni_africa/shared/widgets/auth_text_field.dart';
import 'package:loni_africa/shared/widgets/divider_with_text.dart';
import 'package:loni_africa/shared/widgets/primary_button.dart';
import 'package:loni_africa/shared/widgets/screen_header.dart';
import 'package:loni_africa/shared/widgets/social_login_row.dart';
import 'package:loni_africa/shared/widgets/texture_overlay.dart';
import 'package:loni_africa/shared/widgets/theme_toggle_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String path = '/login';
  static const String name = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

  void _onSignIn() {
    // TODO: Implement sign in logic
  }

  void _onGoogleSignIn() {
    // TODO: Implement Google sign in
  }

  void _onPhoneSignIn() {
    // TODO: Implement phone sign in
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
                    title: 'Welcome Back',
                    subtitle: 'Sign in to continue your reading journey',
                    showBackButton: true,
                    trailingWidget: ThemeToggleButton(
                      onToggle: themeNotifier.onToggle,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  AuthTextField(
                    label: 'Email or Phone Number',
                    hintText: 'name@example.com',
                    prefixIcon: Icons.email_outlined,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20.h),
                  AuthTextField(
                    label: 'Password',
                    hintText: 'Enter your password',
                    prefixIcon: Icons.lock_outline,
                    controller: _passwordController,
                    isPassword: !_isPasswordVisible,
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
                            'Remember me',
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
                          'Forgot Password?',
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
                    text: 'Sign In',
                    onPressed: _onSignIn,
                  ),
                  SizedBox(height: 24.h),
                  const DividerWithText(text: 'Or continue with'),
                  SizedBox(height: 24.h),
                  SocialLoginRow(
                    onGooglePressed: _onGoogleSignIn,
                    onPhonePressed: _onPhoneSignIn,
                  ),
                  SizedBox(height: 32.h),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Don\'t have an account? ',
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
                            'Sign Up',
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
                      'By continuing, you agree to Loni\'s Terms of Service\nand Privacy Policy',
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
        ],
      ),
    );
  }
}
