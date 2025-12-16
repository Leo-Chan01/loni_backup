import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Service for managing app language/locale persistence
class LanguageService {
  static const String _localeKey = 'app_locale';

  /// Get saved locale from SharedPreferences
  /// Returns null if no locale has been saved
  Future<Locale?> getSavedLocale() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final localeCode = prefs.getString(_localeKey);
      
      if (localeCode != null) {
        return Locale(localeCode);
      }
      return null;
    } catch (e) {
      debugPrint('Error loading saved locale: $e');
      return null;
    }
  }

  /// Save locale to SharedPreferences
  Future<void> saveLocale(Locale locale) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_localeKey, locale.languageCode);
    } catch (e) {
      debugPrint('Error saving locale: $e');
    }
  }

  /// Clear saved locale (will revert to system default)
  Future<void> clearLocale() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_localeKey);
    } catch (e) {
      debugPrint('Error clearing locale: $e');
    }
  }

  /// Get list of supported locales
  static List<Locale> getSupportedLocales() {
    return const [
      Locale('en'), // English
      Locale('fr'), // French
      Locale('es'), // Spanish
    ];
  }

  /// Get locale display name
  static String getLocaleDisplayName(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return 'English';
      case 'fr':
        return 'Français';
      case 'es':
        return 'Español';
      default:
        return locale.languageCode;
    }
  }

  /// Get locale native name (in the language itself)
  static String getLocaleNativeName(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return 'English';
      case 'fr':
        return 'Français';
      case 'es':
        return 'Español';
      default:
        return locale.languageCode;
    }
  }
}
