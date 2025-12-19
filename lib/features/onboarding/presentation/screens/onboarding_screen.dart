import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/main.dart';
import 'package:loni_africa/shared/widgets/onboarding_content.dart';
import 'package:loni_africa/shared/widgets/onboarding_image_card.dart';
import 'package:loni_africa/shared/widgets/onboarding_page_indicator.dart';
import 'package:loni_africa/shared/widgets/primary_button.dart';
import 'package:loni_africa/shared/widgets/secondary_button.dart';
import 'package:loni_africa/shared/widgets/texture_overlay.dart';
import 'package:loni_africa/shared/widgets/theme_toggle_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static const String path = '/onboarding';
  static const String name = 'OnboardingScreen';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  static const List<Map<String, String>> _pageConfig = [
    {
      'titleKey': 'onboardingTitle1',
      'descriptionKey': 'onboardingDesc1',
      'imageUrl':
          'https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?q=80&w=800&auto=format&fit=crop',
      'icon': 'Icons.menu_book_rounded',
    },
    {
      'titleKey': 'onboardingTitle2',
      'descriptionKey': 'onboardingDesc2',
      'imageUrl':
          'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?q=80&w=800&auto=format&fit=crop',
      'icon': 'Icons.download_rounded',
    },
    {
      'titleKey': 'onboardingTitle3',
      'descriptionKey': 'onboardingDesc3',
      'imageUrl':
          'https://images.unsplash.com/photo-1519682337058-a94d519337bc?q=80&w=800&auto=format&fit=crop',
      'icon': 'Icons.people_rounded',
    },
  ];

  List<Map<String, dynamic>> _getPages(BuildContext context) {
    final l10n = context.l10n;
    return [
      {
        'title': l10n.onboardingTitle1,
        'description': l10n.onboardingDesc1,
        'imageUrl': _pageConfig[0]['imageUrl'],
        'icon': Icons.menu_book_rounded,
      },
      {
        'title': l10n.onboardingTitle2,
        'description': l10n.onboardingDesc2,
        'imageUrl': _pageConfig[1]['imageUrl'],
        'icon': Icons.download_rounded,
      },
      {
        'title': l10n.onboardingTitle3,
        'description': l10n.onboardingDesc3,
        'imageUrl': _pageConfig[2]['imageUrl'],
        'icon': Icons.people_rounded,
      },
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  Future<void> _onNext(BuildContext context) async {
    final pages = _getPages(context);
    if (_currentPage < pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _navigateToLogin();
    }
  }

  void _onSkip() {
    _navigateToLogin();
  }

  void _navigateToLogin() {
    context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final themeNotifier = ThemeNotifier.of(context);
    final pages = _getPages(context);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Stack(
        children: [
          const TextureOverlay(),
          SafeArea(
            child: Column(
              children: [
                _buildTopBar(themeNotifier, context),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: _onPageChanged,
                    itemCount: pages.length,
                    itemBuilder: (context, index) {
                      return _buildPage(pages[index]);
                    },
                  ),
                ),
                _buildBottomSection(context, pages),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(ThemeNotifier themeNotifier, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: _onSkip,
            child: Text(
              context.l10n.skip,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ),
          ThemeToggleButton(onToggle: themeNotifier.onToggle),
        ],
      ),
    );
  }

  Widget _buildPage(Map<String, dynamic> pageData) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 24.h),
          OnboardingImageCard(
            imageUrl: pageData['imageUrl'],
            icon: pageData['icon'],
          ),
          SizedBox(height: 48.h),
          OnboardingContent(
            title: pageData['title'],
            description: pageData['description'],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSection(
    BuildContext context,
    List<Map<String, dynamic>> pages,
  ) {
    final isLastPage = _currentPage == pages.length - 1;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Column(
        children: [
          OnboardingPageIndicator(
            currentPage: _currentPage,
            totalPages: pages.length,
          ),
          SizedBox(height: 32.h),
          PrimaryButton(
            text: isLastPage ? context.l10n.getStarted : context.l10n.next,
            onPressed: () => _onNext(context),
          ),
          if (isLastPage) ...[
            SizedBox(height: 8.h),
            SecondaryButton(
              text: context.l10n.alreadyHaveAccount,
              onPressed: _onSkip,
            ),
          ],
        ],
      ),
    );
  }
}
