import 'package:flutter/material.dart';
import 'package:loni_africa/l10n/app_localizations.dart';

/// Extension on BuildContext to easily access AppLocalizations
extension LocalizationExtension on BuildContext {
  /// Get the current AppLocalizations instance
  ///
  /// Usage: context.l10n.signIn
  AppLocalizations get l10n {
    final localizations = AppLocalizations.of(this);
    assert(localizations != null, 'AppLocalizations not found in context');
    return localizations!;
  }
}
