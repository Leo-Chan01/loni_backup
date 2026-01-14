import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utilities/localization_extension.dart';
import '../../../../../core/utilities/json_map.dart';
import '../../../../../shared/widgets/global_snackbar.dart';
import '../../../../../shared/widgets/primary_button.dart';
import '../../provider/auth_account_provider.dart';
import '../../../../../shared/widgets/auth_text_field.dart';

class AuthPreferencesScreen extends StatefulWidget {
  const AuthPreferencesScreen({super.key});

  static const String name = 'auth-preferences';
  static const String path = '/auth/preferences';

  @override
  State<AuthPreferencesScreen> createState() => _AuthPreferencesScreenState();
}

class _AuthPreferencesScreenState extends State<AuthPreferencesScreen> {
  final TextEditingController _preferredGenresController =
      TextEditingController();
  final TextEditingController _preferredLanguagesController =
      TextEditingController();

  bool _initializedFromRemote = false;

  bool _allowEmailUpdates = false;
  bool _allowSmsUpdates = false;
  bool _allowPushNotifications = false;

  String _readingTheme = 'system';
  String _textScale = 'normal';

  bool _dyslexicFont = false;
  bool _highContrast = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthAccountProvider>().loadPreferences();
    });
  }

  @override
  void dispose() {
    _preferredGenresController.dispose();
    _preferredLanguagesController.dispose();
    super.dispose();
  }

  void _applyFromMap(JsonMap preferences) {
    final genres = preferences['preferredGenres'];
    if (genres is List) {
      _preferredGenresController.text = genres.join(', ');
    }

    final languages = preferences['preferredLanguages'];
    if (languages is List) {
      _preferredLanguagesController.text = languages.join(', ');
    }

    _allowEmailUpdates = preferences['allowEmailUpdates'] == true;
    _allowSmsUpdates = preferences['allowSmsUpdates'] == true;
    _allowPushNotifications = preferences['allowPushNotifications'] == true;

    final readingTheme = preferences['readingTheme'];
    if (readingTheme is String && readingTheme.isNotEmpty) {
      _readingTheme = readingTheme;
    }

    final textScale = preferences['textScale'];
    if (textScale is String && textScale.isNotEmpty) {
      _textScale = textScale;
    }

    final accessibility = preferences['accessibility'];
    if (accessibility is JsonMap) {
      _dyslexicFont = accessibility['dyslexicFont'] == true;
      _highContrast = accessibility['highContrast'] == true;
    }
  }

  void _maybeInitializeFromRemote(JsonMap? preferences) {
    if (_initializedFromRemote) return;
    if (preferences == null) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _initializedFromRemote) return;
      setState(() {
        _applyFromMap(preferences);
        _initializedFromRemote = true;
      });
    });
  }

  List<String> _splitCommaSeparated(String value) {
    return value
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList(growable: false);
  }

  String _readingThemeLabel(BuildContext context, String value) {
    final l10n = context.l10n;
    switch (value) {
      case 'light':
        return l10n.readingThemeLight;
      case 'dark':
        return l10n.readingThemeDark;
      case 'system':
      default:
        return l10n.readingThemeSystem;
    }
  }

  String _textScaleLabel(BuildContext context, String value) {
    final l10n = context.l10n;
    switch (value) {
      case 'small':
        return l10n.textScaleSmall;
      case 'large':
        return l10n.textScaleLarge;
      case 'normal':
      default:
        return l10n.textScaleNormal;
    }
  }

  Future<void> _save(AuthAccountProvider provider) async {
    final payload = <String, dynamic>{
      'preferredGenres': _splitCommaSeparated(_preferredGenresController.text),
      'preferredLanguages':
          _splitCommaSeparated(_preferredLanguagesController.text),
      'allowEmailUpdates': _allowEmailUpdates,
      'allowSmsUpdates': _allowSmsUpdates,
      'allowPushNotifications': _allowPushNotifications,
      'readingTheme': _readingTheme,
      'textScale': _textScale,
      'accessibility': {
        'dyslexicFont': _dyslexicFont,
        'highContrast': _highContrast,
      },
    };

    await provider.savePreferences(payload);

    if (!mounted) return;
    if (provider.errorMessage == null) {
      GlobalSnackBar.showSuccess(context.l10n.changesSaved);
    } else {
      GlobalSnackBar.showError(provider.errorMessage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final provider = context.watch<AuthAccountProvider>();

    _maybeInitializeFromRemote(provider.preferences);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: HugeIcon(
            icon: HugeIcons.strokeRoundedArrowLeft01,
            color: colorScheme.onSurface,
            size: 24.sp,
          ),
        ),
        title: Text(l10n.authPreferences),
        actions: [
          IconButton(
            onPressed: provider.isLoading
                ? null
                : () => context.read<AuthAccountProvider>().loadPreferences(),
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedRefresh,
              color: colorScheme.onSurface,
              size: 22.sp,
            ),
          ),
        ],
      ),
      body: provider.isLoading && provider.preferences == null
          ? Center(
              child: CircularProgressIndicator(color: colorScheme.primary),
            )
          : ListView(
              padding: EdgeInsets.all(20.w),
              children: [
                AuthTextField(
                  label: l10n.preferredGenres,
                  hintText: l10n.preferredGenresHint,
                  controller: _preferredGenresController,
                ),
                SizedBox(height: 16.h),
                AuthTextField(
                  label: l10n.preferredLanguages,
                  hintText: l10n.preferredLanguagesHint,
                  controller: _preferredLanguagesController,
                ),
                SizedBox(height: 16.h),
                SwitchListTile(
                  value: _allowEmailUpdates,
                  onChanged: (value) {
                    setState(() {
                      _allowEmailUpdates = value;
                    });
                  },
                  title: Text(l10n.allowEmailUpdates),
                ),
                SwitchListTile(
                  value: _allowSmsUpdates,
                  onChanged: (value) {
                    setState(() {
                      _allowSmsUpdates = value;
                    });
                  },
                  title: Text(l10n.allowSmsUpdates),
                ),
                SwitchListTile(
                  value: _allowPushNotifications,
                  onChanged: (value) {
                    setState(() {
                      _allowPushNotifications = value;
                    });
                  },
                  title: Text(l10n.allowPushNotifications),
                ),
                SizedBox(height: 8.h),
                DropdownButtonFormField<String>(
                  initialValue: _readingTheme,
                  decoration: InputDecoration(
                    labelText: l10n.readingTheme,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(
                        color: colorScheme.outline.withValues(alpha: 0.3),
                      ),
                    ),
                  ),
                  items: const ['system', 'light', 'dark']
                      .map(
                        (value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(_readingThemeLabel(context, value)),
                        ),
                      )
                      .toList(growable: false),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      _readingTheme = value;
                    });
                  },
                ),
                SizedBox(height: 16.h),
                DropdownButtonFormField<String>(
                  initialValue: _textScale,
                  decoration: InputDecoration(
                    labelText: l10n.textScale,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(
                        color: colorScheme.outline.withValues(alpha: 0.3),
                      ),
                    ),
                  ),
                  items: const ['small', 'normal', 'large']
                      .map(
                        (value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(_textScaleLabel(context, value)),
                        ),
                      )
                      .toList(growable: false),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      _textScale = value;
                    });
                  },
                ),
                SizedBox(height: 16.h),
                SwitchListTile(
                  value: _dyslexicFont,
                  onChanged: (value) {
                    setState(() {
                      _dyslexicFont = value;
                    });
                  },
                  title: Text(l10n.dyslexicFont),
                ),
                SwitchListTile(
                  value: _highContrast,
                  onChanged: (value) {
                    setState(() {
                      _highContrast = value;
                    });
                  },
                  title: Text(l10n.highContrast),
                ),
                SizedBox(height: 24.h),
                PrimaryButton(
                  text: l10n.save,
                  isLoading: provider.isLoading,
                  onPressed: () => _save(context.read<AuthAccountProvider>()),
                ),
                if (provider.errorMessage != null) ...[
                  SizedBox(height: 12.h),
                  Text(
                    provider.errorMessage!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.error,
                    ),
                  ),
                ],
              ],
            ),
    );
  }
}
