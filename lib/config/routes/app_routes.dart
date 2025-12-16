import 'package:go_router/go_router.dart';
import 'package:loni_africa/features/auth/presentation/screens/login_screen.dart';
import 'package:loni_africa/features/dashboard/presentation/screens/main_screen.dart';
import 'package:loni_africa/features/onboarding/presentation/screens/language_selection_screen.dart';
import 'package:loni_africa/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:loni_africa/splash_screen.dart';

class AppRoutes {
  static String splashScreenRoute = '/';

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splashScreenRoute,
    redirect: (context, state) {
      return null;
    },
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: splashScreenRoute,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: LanguageSelectionScreen.path,
        name: LanguageSelectionScreen.name,
        builder: (context, state) {
          return const LanguageSelectionScreen();
        },
      ),
      GoRoute(
        path: OnboardingScreen.path,
        name: OnboardingScreen.name,
        builder: (context, state) {
          return const OnboardingScreen();
        },
      ),
      GoRoute(
        path: LoginScreen.path,
        name: LoginScreen.name,
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: MainScreen.path,
        name: MainScreen.name,
        builder: (context, state) {
          return const MainScreen();
        },
      ),
    ],
  );
}
