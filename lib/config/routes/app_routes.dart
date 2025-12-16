import 'package:go_router/go_router.dart';
import 'package:loni_africa/features/auth/presentation/screens/login_screen.dart';
import 'package:loni_africa/features/auth/presentation/screens/otp_verification_screen.dart';
import 'package:loni_africa/features/dashboard/presentation/screens/main_screen.dart';
import 'package:loni_africa/features/dashboard/presentation/screens/main_tabs_scaffold.dart';
import 'package:loni_africa/features/discovery/presentation/screens/explore_root_screen.dart';
import 'package:loni_africa/features/discovery/presentation/screens/home_screen.dart';
import 'package:loni_africa/features/discovery/presentation/screens/search_screen.dart';
import 'package:loni_africa/features/library/presentation/screens/library_screen.dart';
import 'package:loni_africa/features/onboarding/presentation/screens/language_selection_screen.dart';
import 'package:loni_africa/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:loni_africa/features/profile/presentation/screens/profile_screen.dart';
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
      // Auth & onboarding flows
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
        path: OtpVerificationScreen.path,
        name: OtpVerificationScreen.name,
        builder: (context, state) {
          final email = state.uri.queryParameters['email'];
          final phoneNumber = state.uri.queryParameters['phoneNumber'];
          return OtpVerificationScreen(
            email: email,
            phoneNumber: phoneNumber,
          );
        },
      ),
      // App shell with bottom tabs (stateful)
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            MainTabsScaffold(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: HomeScreen.path,
                name: HomeScreen.name,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: ExploreRootScreen.path,
                name: ExploreRootScreen.name,
                builder: (context, state) => const ExploreRootScreen(),
              ),
              GoRoute(
                path: SearchScreen.path,
                name: SearchScreen.name,
                builder: (context, state) {
                  final q = state.uri.queryParameters['q'];
                  return SearchScreen(initialQuery: q);
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: LibraryScreen.path,
                name: LibraryScreen.name,
                builder: (context, state) => const LibraryScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: ProfileScreen.path,
                name: ProfileScreen.name,
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
      // Legacy/main placeholder route remains to avoid breaking links
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
