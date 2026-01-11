import 'package:loni_africa/l10n/app_localizations.dart';

/// Validation utility class for form inputs
class Validators {
  Validators._();

  static const int minPasswordLength = 8;
  static const int minNameLength = 2;
  static const int maxNameLength = 50;

  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static final RegExp _e164PhoneRegex = RegExp(r'^\+?[1-9]\d{1,14}$');
  static final RegExp _phoneSeparatorsRegex = RegExp(r'[\s-]');

  static bool isValidEmail(String value) => _emailRegex.hasMatch(value.trim());

  static bool isValidName(String value) {
    final trimmed = value.trim();
    return trimmed.isNotEmpty &&
        trimmed.length >= minNameLength &&
        trimmed.length <= maxNameLength;
  }

  static bool isValidPassword(String value) {
    return value.isNotEmpty && value.length >= minPasswordLength;
  }

  static bool isValidPhone(String value) {
    final cleaned = value.trim().replaceAll(_phoneSeparatorsRegex, '');
    return _e164PhoneRegex.hasMatch(cleaned);
  }

  static bool isValidEmailOrPhone(String value) {
    final trimmed = value.trim();
    return isValidEmail(trimmed) || isValidPhone(trimmed);
  }

  /// Validates email format
  static String? validateEmail(AppLocalizations l10n, String? value) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return l10n.fieldRequired(l10n.emailLabel);
    }
    if (!isValidEmail(trimmed)) {
      return l10n.invalidEmailAddress;
    }
    return null;
  }

  /// Validates phone number format
  static String? validatePhone(AppLocalizations l10n, String? value) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return l10n.fieldRequired(l10n.phoneLabel);
    }
    if (!isValidPhone(trimmed)) {
      return l10n.invalidPhoneNumber;
    }
    return null;
  }

  /// Validates email or phone number
  static String? validateEmailOrPhone(AppLocalizations l10n, String? value) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return l10n.fieldRequired(l10n.emailOrPhoneLabel);
    }
    if (!isValidEmailOrPhone(trimmed)) {
      return l10n.invalidEmailOrPhone;
    }
    return null;
  }

  /// Validates name format
  static String? validateName(AppLocalizations l10n, String? value) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return l10n.fieldRequired(l10n.nameLabel);
    }
    if (trimmed.length < minNameLength) {
      return l10n.fieldMinLength(l10n.nameLabel, minNameLength);
    }
    if (trimmed.length > maxNameLength) {
      return l10n.fieldMaxLength(l10n.nameLabel, maxNameLength);
    }
    return null;
  }

  /// Validates password
  static String? validatePassword(AppLocalizations l10n, String? value) {
    final raw = value ?? '';
    if (raw.isEmpty) {
      return l10n.passwordRequired;
    }
    if (raw.length < minPasswordLength) {
      return l10n.fieldMinLength(l10n.passwordLabel, minPasswordLength);
    }
    return null;
  }

  /// Validates password confirmation
  static String? validateConfirmPassword(
    AppLocalizations l10n,
    String? value,
    String passwordToMatch,
  ) {
    final passwordError = validatePassword(l10n, value);
    if (passwordError != null) {
      return passwordError;
    }
    if (value != passwordToMatch) {
      return l10n.passwordsDoNotMatch;
    }
    return null;
  }

  /// Validates required field
  static String? validateRequired(
    AppLocalizations l10n,
    String? value,
    String fieldLabel,
  ) {
    if (value == null || value.trim().isEmpty) {
      return l10n.fieldRequired(fieldLabel);
    }
    return null;
  }
}
