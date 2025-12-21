import 'package:go_router/go_router.dart';
import 'package:loni_africa/features/auth/presentation/screens/login_screen.dart';
import 'package:loni_africa/features/auth/presentation/screens/otp_verification_screen.dart';
import 'package:loni_africa/features/dashboard/presentation/screens/main_screen.dart';
import 'package:loni_africa/features/dashboard/presentation/screens/main_tabs_scaffold.dart';
import 'package:loni_africa/features/discovery/presentation/screens/explore_root_screen.dart';
import 'package:loni_africa/features/discovery/presentation/screens/home_screen.dart';
import 'package:loni_africa/features/discovery/presentation/screens/search_screen.dart';
import 'package:loni_africa/features/discovery/presentation/screens/categories_screen.dart';
import 'package:loni_africa/features/discovery/presentation/screens/category_detail_screen.dart';
import 'package:loni_africa/features/discovery/presentation/screens/author_screen.dart';
import 'package:loni_africa/features/discovery/presentation/screens/publisher_screen.dart';
import 'package:loni_africa/features/discovery/presentation/screens/trending_screen.dart';
import 'package:loni_africa/features/discovery/presentation/screens/featured_screen.dart';
import 'package:loni_africa/features/library/presentation/screens/library_screen.dart';
import 'package:loni_africa/features/onboarding/presentation/screens/language_selection_screen.dart';
import 'package:loni_africa/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:loni_africa/features/profile/presentation/screens/profile_screen.dart';
import 'package:loni_africa/features/reading/presentation/screens/book_detail_screen.dart';
import 'package:loni_africa/features/reading/presentation/screens/book_preview_screen.dart';
import 'package:loni_africa/features/reading/presentation/screens/reader_screen.dart';
import 'package:loni_africa/features/reading/presentation/screens/reader_settings_screen.dart';
import 'package:loni_africa/features/reading/presentation/screens/table_of_contents_screen.dart';
import 'package:loni_africa/features/reading/presentation/screens/highlights_notes_screen.dart';
import 'package:loni_africa/features/reading/presentation/screens/reading_progress_screen.dart';
import 'package:loni_africa/features/reading/presentation/screens/offline_manager_screen.dart';
import 'package:loni_africa/features/reading/presentation/screens/reading_stats_screen.dart';
import 'package:loni_africa/features/commerce/presentation/screens/format_selection_screen.dart';
import 'package:loni_africa/features/commerce/presentation/screens/checkout_screen.dart';
import 'package:loni_africa/features/commerce/presentation/screens/payment_method_screen.dart';
import 'package:loni_africa/features/commerce/presentation/screens/payment_pending_screen.dart';
import 'package:loni_africa/features/commerce/presentation/screens/payment_success_screen.dart';
import 'package:loni_africa/features/commerce/presentation/screens/orders_list_screen.dart';
import 'package:loni_africa/features/commerce/presentation/screens/order_tracking_screen.dart';
import 'package:loni_africa/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:loni_africa/features/profile/presentation/screens/bookmarks_screen.dart';
import 'package:loni_africa/features/community/presentation/screens/community_screen.dart';
import 'package:loni_africa/features/community/presentation/screens/discussion_screen.dart';
import 'package:loni_africa/features/community/presentation/screens/create_post_screen.dart';
import 'package:loni_africa/features/community/presentation/screens/notifications_screen.dart';
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
          return OtpVerificationScreen(email: email, phoneNumber: phoneNumber);
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
                routes: [
                  GoRoute(
                    path: SearchScreen.path,
                    name: SearchScreen.name,
                    builder: (context, state) {
                      final q = state.uri.queryParameters['q'];
                      return SearchScreen(initialQuery: q);
                    },
                  ),
                  GoRoute(
                    path: CategoriesScreen.path,
                    name: CategoriesScreen.name,
                    builder: (context, state) => const CategoriesScreen(),
                  ),
                  GoRoute(
                    path: CategoryDetailScreen.path,
                    name: CategoryDetailScreen.name,
                    builder: (context, state) {
                      final categoryId = state.pathParameters['id'];
                      return CategoryDetailScreen(categoryId: categoryId);
                    },
                  ),
                  GoRoute(
                    path: AuthorScreen.path,
                    name: AuthorScreen.name,
                    builder: (context, state) {
                      final authorId = state.pathParameters['id'];
                      return AuthorScreen(authorId: authorId);
                    },
                  ),
                  GoRoute(
                    path: PublisherScreen.path,
                    name: PublisherScreen.name,
                    builder: (context, state) {
                      final publisherId = state.pathParameters['id'];
                      return PublisherScreen(publisherId: publisherId);
                    },
                  ),
                  GoRoute(
                    path: TrendingScreen.path,
                    name: TrendingScreen.name,
                    builder: (context, state) => const TrendingScreen(),
                  ),
                  GoRoute(
                    path: FeaturedScreen.path,
                    name: FeaturedScreen.name,
                    builder: (context, state) => const FeaturedScreen(),
                  ),
                ],
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
      // Reading feature routes
      GoRoute(
        path: BookDetailScreen.path,
        name: BookDetailScreen.name,
        builder: (context, state) {
          final bookId = state.pathParameters['bookId']!;
          return BookDetailScreen(bookId: bookId);
        },
      ),
      GoRoute(
        path: BookPreviewScreen.path,
        name: BookPreviewScreen.name,
        builder: (context, state) {
          final bookId = state.pathParameters['bookId']!;
          return BookPreviewScreen(bookId: bookId);
        },
      ),
      GoRoute(
        path: ReaderScreen.path,
        name: ReaderScreen.name,
        builder: (context, state) {
          final bookId = state.pathParameters['bookId']!;
          return ReaderScreen(bookId: bookId);
        },
      ),
      GoRoute(
        path: ReaderSettingsScreen.path,
        name: ReaderSettingsScreen.name,
        builder: (context, state) {
          final bookId = state.pathParameters['bookId']!;
          return ReaderSettingsScreen(bookId: bookId);
        },
      ),
      GoRoute(
        path: TableOfContentsScreen.path,
        name: TableOfContentsScreen.name,
        builder: (context, state) {
          final bookId = state.pathParameters['bookId']!;
          return TableOfContentsScreen(bookId: bookId);
        },
      ),
      GoRoute(
        path: HighlightsNotesScreen.path,
        name: HighlightsNotesScreen.name,
        builder: (context, state) {
          final bookId = state.pathParameters['bookId']!;
          return HighlightsNotesScreen(bookId: bookId);
        },
      ),
      GoRoute(
        path: ReadingProgressScreen.path,
        name: ReadingProgressScreen.name,
        builder: (context, state) {
          final bookId = state.pathParameters['bookId']!;
          return ReadingProgressScreen(bookId: bookId);
        },
      ),
      GoRoute(
        path: OfflineManagerScreen.path,
        name: OfflineManagerScreen.name,
        builder: (context, state) {
          return const OfflineManagerScreen();
        },
      ),
      // Reading stats route
      GoRoute(
        path: ReadingStatsScreen.path,
        name: ReadingStatsScreen.name,
        builder: (context, state) {
          return const ReadingStatsScreen();
        },
      ),
      // Commerce & Orders routes
      GoRoute(
        path: FormatSelectionScreen.path,
        name: FormatSelectionScreen.name,
        builder: (context, state) {
          final bookId = state.pathParameters['bookId']!;
          return FormatSelectionScreen(bookId: bookId);
        },
      ),
      GoRoute(
        path: CheckoutScreen.path,
        name: CheckoutScreen.name,
        builder: (context, state) {
          final bookId = state.pathParameters['bookId']!;
          return CheckoutScreen(bookId: bookId);
        },
      ),
      GoRoute(
        path: PaymentMethodScreen.path,
        name: PaymentMethodScreen.name,
        builder: (context, state) {
          final bookId = state.pathParameters['bookId']!;
          return PaymentMethodScreen(bookId: bookId);
        },
      ),
      GoRoute(
        path: PaymentPendingScreen.path,
        name: PaymentPendingScreen.name,
        builder: (context, state) {
          final bookId = state.pathParameters['bookId']!;
          return PaymentPendingScreen(bookId: bookId);
        },
      ),
      GoRoute(
        path: PaymentSuccessScreen.path,
        name: PaymentSuccessScreen.name,
        builder: (context, state) {
          final bookId = state.pathParameters['bookId']!;
          return PaymentSuccessScreen(bookId: bookId);
        },
      ),
      GoRoute(
        path: OrdersListScreen.path,
        name: OrdersListScreen.name,
        builder: (context, state) {
          return const OrdersListScreen();
        },
      ),
      GoRoute(
        path: OrderTrackingScreen.path,
        name: OrderTrackingScreen.name,
        builder: (context, state) {
          final orderId = state.pathParameters['orderId']!;
          return OrderTrackingScreen(orderId: orderId);
        },
      ),
      // Profile & Community routes
      GoRoute(
        path: EditProfileScreen.path,
        name: EditProfileScreen.name,
        builder: (context, state) {
          return const EditProfileScreen();
        },
      ),
      GoRoute(
        path: BookmarksScreen.path,
        name: BookmarksScreen.name,
        builder: (context, state) {
          return const BookmarksScreen();
        },
      ),
      GoRoute(
        path: CommunityScreen.path,
        name: CommunityScreen.name,
        builder: (context, state) {
          return const CommunityScreen();
        },
      ),
      GoRoute(
        path: DiscussionScreen.path,
        name: DiscussionScreen.name,
        builder: (context, state) {
          final postId = state.pathParameters['postId']!;
          return DiscussionScreen(postId: postId);
        },
      ),
      GoRoute(
        path: CreatePostScreen.path,
        name: CreatePostScreen.name,
        builder: (context, state) {
          return const CreatePostScreen();
        },
      ),
      GoRoute(
        path: NotificationsScreen.path,
        name: NotificationsScreen.name,
        builder: (context, state) {
          return const NotificationsScreen();
        },
      ),
    ],
  );
}
