import 'package:loni_africa/core/utilities/validators.dart';
import 'package:loni_africa/l10n/app_localizations.dart';

extension StringValidators on String? {
  String? validateEmail(AppLocalizations l10n) {
    return Validators.validateEmail(l10n, this);
  }

  String? validateEmailOrUserName(
    AppLocalizations l10n, {
    required String usernameLabel,
    int minUsernameLength = 3,
  }) {
    final trimmed = this?.trim() ?? '';
    if (trimmed.isEmpty) {
      return l10n.fieldRequired(usernameLabel);
    }

    if (Validators.isValidEmail(trimmed)) {
      return null;
    }

    if (trimmed.length < minUsernameLength) {
      return l10n.fieldMinLength(usernameLabel, minUsernameLength);
    }

    return null;
  }

  String? validatePassword(AppLocalizations l10n) {
    return Validators.validatePassword(l10n, this);
  }

  String? validateConfirmPassword(
    AppLocalizations l10n,
    String passwordToMatch,
  ) {
    return Validators.validateConfirmPassword(l10n, this, passwordToMatch);
  }

  String? validateName(AppLocalizations l10n) {
    return Validators.validateName(l10n, this);
  }

  String? validateReferrer(
    AppLocalizations l10n, {
    required String fieldLabel,
    int minLength = 3,
  }) {
    final trimmed = this?.trim() ?? '';
    if (trimmed.isEmpty) {
      return null;
    }
    if (trimmed.length < minLength) {
      return l10n.fieldMinLength(fieldLabel, minLength);
    }
    return null;
  }

  String? validatePin(
    AppLocalizations l10n, {
    required String fieldLabel,
    int minLength = 6,
  }) {
    final trimmed = this?.trim() ?? '';
    if (trimmed.isEmpty) {
      return l10n.fieldRequired(fieldLabel);
    }
    if (trimmed.length < minLength) {
      return l10n.fieldMinLength(fieldLabel, minLength);
    }
    return null;
  }

  String? validatePhoneNumber(
    AppLocalizations l10n, {
    required String fieldLabel,
  }) {
    final trimmed = this?.trim() ?? '';
    if (trimmed.isEmpty) {
      return l10n.fieldRequired(fieldLabel);
    }
    if (!Validators.isValidPhone(trimmed)) {
      return l10n.invalidPhoneNumber;
    }
    return null;
  }

  String? validateLocation(
    AppLocalizations l10n, {
    required String fieldLabel,
    int minLength = 3,
    String? notProvidedValue,
  }) {
    final trimmed = this?.trim() ?? '';
    if (trimmed.isEmpty || (notProvidedValue != null && trimmed == notProvidedValue)) {
      return l10n.fieldRequired(fieldLabel);
    }
    if (trimmed.length < minLength) {
      return l10n.fieldMinLength(fieldLabel, minLength);
    }
    return null;
  }
}
