import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loni_africa/shared/widgets/language_option_card.dart';

class LanguageOptionList extends StatelessWidget {
  const LanguageOptionList({
    super.key,
    required this.languages,
    required this.selectedLanguage,
    required this.onLanguageSelected,
  });

  final List<Map<String, String>> languages;
  final String selectedLanguage;
  final ValueChanged<String> onLanguageSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: languages.length,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final language = languages[index];
        return LanguageOptionCard(
          languageName: language['name']!,
          languageSubtitle: language['subtitle']!,
          isSelected: selectedLanguage == language['name'],
          onTap: () => onLanguageSelected(language['name']!),
        );
      },
    );
  }
}
