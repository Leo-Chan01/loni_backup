import 'package:flutter/material.dart';
import 'package:loni_africa/main.dart';
import 'package:loni_africa/shared/widgets/onboarding_bottom_section.dart';
import 'package:loni_africa/shared/widgets/onboarding_page.dart';
import 'package:loni_africa/shared/widgets/onboarding_top_bar.dart';
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

  final List<Map<String, dynamic>> _pages = [
    {
      'title': 'Unlimited Access to\nAfrican Literature',
      'description':
          'Discover thousands of books from celebrated African authors and emerging voices across the continent.',
      'imageUrl':
          'https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?q=80&w=800&auto=format&fit=crop',
      'icon': Icons.menu_book_rounded,
    },
    {
      'title': 'Read Anywhere,\nAnytime',
      'description':
          'Download books for offline reading. No internet? No problem. Your library travels with you.',
      'imageUrl':
          'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?q=80&w=800&auto=format&fit=crop',
      'icon': Icons.download_rounded,
    },
    {
      'title': 'Support African\nStorytellers',
      'description':
          'Every purchase directly supports African authors and publishers. Help preserve and celebrate our stories.',
      'imageUrl':
          'https://images.unsplash.com/photo-1519682337058-a94d519337bc?q=80&w=800&auto=format&fit=crop',
      'icon': Icons.people_rounded,
    },
  ];

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

  void _onNext() {
    if (_currentPage < _pages.length - 1) {
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
    // TODO: Navigate to login screen
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final themeNotifier = ThemeNotifier.of(context);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Stack(
        children: [
          const TextureOverlay(),
          SafeArea(
            child: Column(
              children: [
                OnboardingTopBar(
                  onSkip: _onSkip,
                  themeToggleButton: ThemeToggleButton(
                    onToggle: themeNotifier.onToggle,
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: _onPageChanged,
                    itemCount: _pages.length,
                    itemBuilder: (context, index) {
                      final pageData = _pages[index];
                      return OnboardingPage(
                        title: pageData['title'],
                        description: pageData['description'],
                        imageUrl: pageData['imageUrl'],
                        icon: pageData['icon'],
                      );
                    },
                  ),
                ),
                OnboardingBottomSection(
                  currentPage: _currentPage,
                  totalPages: _pages.length,
                  onNext: _onNext,
                  onSecondaryAction: _onSkip,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
