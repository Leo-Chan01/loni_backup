import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loni_africa/shared/widgets/animated_logo.dart';
import 'package:loni_africa/shared/widgets/app_branding.dart';
import 'package:loni_africa/shared/widgets/powered_by_footer.dart';
import 'package:loni_africa/shared/widgets/texture_overlay.dart';
import 'package:loni_africa/features/onboarding/presentation/screens/language_selection_screen.dart';
import 'package:loni_africa/features/discovery/presentation/screens/home_screen.dart';
import 'package:loni_africa/features/auth/presentation/screens/otp_verification_screen.dart';
import 'package:loni_africa/features/auth/presentation/provider/auth_provider.dart';
import 'package:loni_africa/shared/widgets/global_snackbar.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String path = '/';
  static const String name = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _bootstrap();
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutBack),
      ),
    );

    _animationController.forward();
  }

  Future<void> _bootstrap() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    if (!mounted) return;

    final authProvider = context.read<AuthProvider>();
    try {
      await authProvider.loadSession();
      if (!mounted) return;

      // Priority order: 
      // 1. If user has completed auth -> Home
      // 2. If user is waiting for OTP verification -> OTP Screen
      // 3. Otherwise -> Language Selection
      String target;
      
      if (authProvider.session != null) {
        // User is fully authenticated
        target = HomeScreen.path;
      } else if (authProvider.hasPendingOtpVerification) {
        // User is in the middle of OTP verification - take them back there
        final identifier = authProvider.pendingOtpVerificationIdentifier!;
        target = '${OtpVerificationScreen.path}?email=$identifier';
      } else {
        // No session and no pending OTP - fresh start
        target = LanguageSelectionScreen.path;
      }
      
      context.go(target);
    } catch (error) {
      if (!mounted) return;
      GlobalSnackBar.showError(error.toString());
      context.go(LanguageSelectionScreen.path);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          const TextureOverlay(),
          _buildMainContent(),
          PoweredByFooter(animation: _fadeAnimation),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedLogo(
            animation: _fadeAnimation,
            scaleAnimation: _scaleAnimation,
          ),
          SizedBox(height: 32.h),
          AppBranding(animation: _fadeAnimation),
        ],
      ),
    );
  }
}
