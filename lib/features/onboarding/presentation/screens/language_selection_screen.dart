import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loni_africa/shared/widgets/language_option_card.dart';
import 'package:loni_africa/shared/widgets/primary_button.dart';
import 'package:loni_africa/shared/widgets/screen_header.dart';
import 'package:loni_africa/shared/widgets/texture_overlay.dart';

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

  void _onContinue() {
    // TODO: Navigate to onboarding
  }

  @override
  Widget build(BuildContext context) {
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
                  const ScreenHeader(
                    title: 'Choose Your Language',
                    subtitle: 'Select your preferred reading language',
                  ),
                  SizedBox(height: 40.h),
                  Expanded(
                    child: _buildLanguageList(),
                  ),
                  _buildBottomSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageList() {
    return ListView.separated(
      itemCount: _languages.length,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final language = _languages[index];
        return LanguageOptionCard(
          languageName: language['name']!,
          languageSubtitle: language['subtitle']!,
          isSelected: _selectedLanguage == language['name'],
          onTap: () => _onLanguageSelected(language['name']!),
        );
      },
    );
  }

  Widget _buildBottomSection() {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h, top: 16.h),
      child: PrimaryButton(
        text: 'Continue',
        onPressed: _onContinue,
      ),
    );
  }
}
