import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loni_africa/core/utilities/language_service.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:loni_africa/main.dart';
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
  final LanguageService _languageService = LanguageService();
  String _selectedLanguageCode = 'en'; // Default to English

  final Map<String, Map<String, String>> _languages = {
    'en': {'name': 'English', 'subtitle': 'English', 'flag': '🇬🇧'},
    'fr': {'name': 'Français', 'subtitle': 'French', 'flag': '🇫🇷'},
    'es': {'name': 'Español', 'subtitle': 'Spanish', 'flag': '🇪🇸'},
  };

  @override
  void initState() {
    super.initState();
    _loadSavedLanguage();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Listen for locale changes from LocaleNotifier
    final localeNotifier = LocaleNotifier.of(context);
    final currentLocale = localeNotifier.locale;

    if (currentLocale != null) {
      final newLanguageCode = currentLocale.languageCode;
      if (_selectedLanguageCode != newLanguageCode) {
        setState(() {
          _selectedLanguageCode = newLanguageCode;
        });
      }
    }
  }

  Future<void> _loadSavedLanguage() async {
    final savedLocale = await _languageService.getSavedLocale();
    if (!mounted) return;
    setState(() {
      _selectedLanguageCode = savedLocale?.languageCode ?? 'en';
    });
  }

  void _onLanguageSelected(String languageCode) {
    setState(() {
      _selectedLanguageCode = languageCode;
    });
  }

  Future<void> _onContinue() async {
    // Save the selected language
    await _languageService.saveLocale(Locale(_selectedLanguageCode));

    // Change app locale
    if (!mounted) return;
    final localeNotifier = LocaleNotifier.of(context);
    localeNotifier.onLocaleChange(Locale(_selectedLanguageCode));

    // Navigate to onboarding
    if (!mounted) return;
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
                    title: context.l10n.language,
                    subtitle: 'Select your preferred language',
                    trailingWidget: ThemeToggleButton(
                      onToggle: themeNotifier.onToggle,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Expanded(
                    child: ListView(
                      children: _languages.entries.map((entry) {
                        final code = entry.key;
                        final info = entry.value;
                        final isSelected = code == _selectedLanguageCode;

                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: GestureDetector(
                            onTap: () => _onLanguageSelected(code),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 20,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                border: Border.all(
                                  color: isSelected
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context)
                                            .colorScheme
                                            .outlineVariant
                                            .withValues(alpha: 0.3),
                                  width: isSelected ? 2.r : 1.r,
                                ),
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          info['name'] ?? '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                fontWeight: isSelected
                                                    ? FontWeight.w700
                                                    : FontWeight.w600,
                                                color: isSelected
                                                    ? Theme.of(
                                                        context,
                                                      ).colorScheme.primary
                                                    : null,
                                              ),
                                        ),
                                        SizedBox(height: 4.h),
                                        Text(
                                          info['subtitle'] ?? '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: Theme.of(
                                                  context,
                                                ).colorScheme.onSurfaceVariant,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (isSelected)
                                    Icon(
                                      Icons.check_circle_rounded,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      size: 28.r,
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 24.h, top: 16.h),
                    child: PrimaryButton(
                      text: context.l10n.continueButton,
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
