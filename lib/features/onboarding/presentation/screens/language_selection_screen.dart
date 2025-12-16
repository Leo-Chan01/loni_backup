import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loni_africa/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:loni_africa/main.dart';
import 'package:loni_africa/shared/widgets/language_option_list.dart';
import 'package:loni_africa/shared/widgets/primary_button.dart';
import 'package:loni_africa/shared/widgets/screen_header.dart';
import 'package:loni_africa/shared/widgets/texture_overlay.dart';
import 'package:loni_africa/shared/widgets/theme_toggle_button.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  static const String path = '/language-selection';
  static const String name = 'LanguageSelectionScreen';

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String _selectedLanguage = 'English';

  final List<Map<String, String>> _languages = [
    {'name': 'English', 'subtitle': 'Default language'},
    {'name': 'Français', 'subtitle': 'French'},
    {'name': 'Kiswahili', 'subtitle': 'Swahili'},
    {'name': 'Português', 'subtitle': 'Portuguese'},
    {'name': 'العربية', 'subtitle': 'Arabic'},
  ];

  void _onLanguageSelected(String language) {
    setState(() {
      _selectedLanguage = language;
    });
  }

  Future<void> _onContinue() async {
    context.go(OnboardingScreen.path);
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = ThemeNotifier.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          const TextureOverlay(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  ScreenHeader(
                    title: 'Choose Your Language',
                    subtitle: 'Select your preferred reading language',
                    trailingWidget: ThemeToggleButton(
                      onToggle: themeNotifier.onToggle,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Expanded(
                    child: LanguageOptionList(
                      languages: _languages,
                      selectedLanguage: _selectedLanguage,
                      onLanguageSelected: _onLanguageSelected,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 24.h, top: 16.h),
                    child: PrimaryButton(
                      text: 'Continue',
                      onPressed: _onContinue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
