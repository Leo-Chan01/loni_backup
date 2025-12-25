import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/settings_section_header.dart';
import '../widgets/settings_tile.dart';
import '../widgets/toggle_settings_tile.dart';

class PrivacySecurityScreen extends StatefulWidget {
  const PrivacySecurityScreen({super.key});

  static const String name = 'privacy-security';
  static const String path = '/privacy-security';

  @override
  State<PrivacySecurityScreen> createState() => _PrivacySecurityScreenState();
}

class _PrivacySecurityScreenState extends State<PrivacySecurityScreen> {
  bool _biometricAuth = true;
  bool _twoFactorAuth = false;

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
          l10n.privacySecurity,
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
          // Security
          SettingsSectionHeader(title: l10n.security),
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
                  title: l10n.biometricAuth,
                  subtitle: l10n.biometricAuthDesc,
                  value: _biometricAuth,
                  onChanged: (value) {
                    setState(() {
                      _biometricAuth = value;
                    });
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                ToggleSettingsTile(
                  title: l10n.twoFactorAuth,
                  subtitle: l10n.twoFactorAuthDesc,
                  value: _twoFactorAuth,
                  onChanged: (value) {
                    setState(() {
                      _twoFactorAuth = value;
                    });
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  title: l10n.activeSessions,
                  onTap: () {
                    // Navigate to active sessions
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  title: l10n.loginHistory,
                  onTap: () {
                    // Navigate to login history
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),

          // Privacy
          SettingsSectionHeader(title: l10n.privacy),
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
                  title: l10n.profileVisibility,
                  subtitle: l10n.publicVisibility,
                  onTap: () {
                    // Navigate to profile visibility settings
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  title: l10n.readingActivity,
                  subtitle: l10n.visibleToFollowers,
                  onTap: () {
                    // Navigate to reading activity settings
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  title: l10n.blockedUsers,
                  onTap: () {
                    // Navigate to blocked users
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  title: l10n.mutedConversations,
                  onTap: () {
                    // Navigate to muted conversations
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),

          // Data & Permissions
          SettingsSectionHeader(title: l10n.dataPermissions),
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
                  title: l10n.downloadYourData,
                  onTap: () {
                    // Download data
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  title: l10n.appPermissions,
                  onTap: () {
                    // Navigate to app permissions
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  title: l10n.privacyPolicy,
                  onTap: () {
                    // Open privacy policy
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  title: l10n.termsOfService,
                  onTap: () {
                    // Open terms of service
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
