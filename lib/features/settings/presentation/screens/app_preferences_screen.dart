import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/settings_section_header.dart';
import '../widgets/settings_tile.dart';
import '../widgets/toggle_settings_tile.dart';

class AppPreferencesScreen extends StatefulWidget {
  const AppPreferencesScreen({super.key});

  static const String name = 'app-preferences';
  static const String path = '/app-preferences';

  @override
  State<AppPreferencesScreen> createState() => _AppPreferencesScreenState();
}

class _AppPreferencesScreenState extends State<AppPreferencesScreen> {
  bool _autoDownload = false;
  bool _keepScreenAwake = true;
  bool _pushNotifications = true;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back, color: colorScheme.onSurface),
        ),
        title: Text(
          l10n.appPreferences,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            fontFamily: 'Merriweather',
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.w),
        children: [
          // Appearance
          SettingsSectionHeader(title: l10n.appearance),
          Container(
            decoration: BoxDecoration(
              color: colorScheme.surface,
              border: Border.all(
                color: colorScheme.outline.withValues(alpha: 0.2),
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                SettingsTile(
                  title: l10n.theme,
                  subtitle: l10n.darkMode,
                  onTap: () {
                    // Navigate to theme settings
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  title: l10n.fontSize,
                  subtitle: l10n.medium,
                  onTap: () {
                    // Navigate to font size settings
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  title: l10n.displayLanguage,
                  subtitle: l10n.english,
                  onTap: () {
                    // Navigate to language settings
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),

          // Reading
          SettingsSectionHeader(title: l10n.reading),
          Container(
            decoration: BoxDecoration(
              color: colorScheme.surface,
              border: Border.all(
                color: colorScheme.outline.withValues(alpha: 0.2),
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                SettingsTile(
                  title: l10n.pageTurnAnimation,
                  subtitle: l10n.slide,
                  onTap: () {
                    // Navigate to page turn animation settings
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  title: l10n.screenBrightness,
                  subtitle: l10n.autoAdjustBrightness,
                  onTap: () {
                    // Navigate to screen brightness settings
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                ToggleSettingsTile(
                  title: l10n.keepScreenAwake,
                  subtitle: l10n.preventScreenTimeout,
                  value: _keepScreenAwake,
                  onChanged: (value) {
                    setState(() {
                      _keepScreenAwake = value;
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),

          // Downloads
          SettingsSectionHeader(title: l10n.downloads),
          Container(
            decoration: BoxDecoration(
              color: colorScheme.surface,
              border: Border.all(
                color: colorScheme.outline.withValues(alpha: 0.2),
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                ToggleSettingsTile(
                  title: l10n.autoDownload,
                  subtitle: l10n.autoDownloadDesc,
                  value: _autoDownload,
                  onChanged: (value) {
                    setState(() {
                      _autoDownload = value;
                    });
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  title: l10n.downloadQuality,
                  subtitle: l10n.highQuality,
                  onTap: () {
                    // Navigate to download quality settings
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  title: l10n.storageLocation,
                  subtitle: l10n.internalStorage,
                  onTap: () {
                    // Navigate to storage location settings
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),

          // Notifications
          SettingsSectionHeader(title: l10n.notifications),
          Container(
            decoration: BoxDecoration(
              color: colorScheme.surface,
              border: Border.all(
                color: colorScheme.outline.withValues(alpha: 0.2),
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                ToggleSettingsTile(
                  title: l10n.pushNotifications,
                  subtitle: l10n.receiveNotifications,
                  value: _pushNotifications,
                  onChanged: (value) {
                    setState(() {
                      _pushNotifications = value;
                    });
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  title: l10n.notificationPreferences,
                  onTap: () {
                    // Navigate to notification preferences
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),

          // Data Usage
          SettingsSectionHeader(title: l10n.dataUsage),
          Container(
            decoration: BoxDecoration(
              color: colorScheme.surface,
              border: Border.all(
                color: colorScheme.outline.withValues(alpha: 0.2),
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                SettingsTile(
                  title: l10n.dataSaverMode,
                  subtitle: l10n.reduceDataUsage,
                  onTap: () {
                    // Navigate to data saver settings
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  title: l10n.clearCache,
                  onTap: () {
                    // Show clear cache dialog
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
