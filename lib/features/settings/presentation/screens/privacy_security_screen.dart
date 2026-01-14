import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/utilities/localization_extension.dart';
import '../../../auth/presentation/screens/account/auth_devices_screen.dart';
import '../../../auth/presentation/screens/account/auth_privacy_screen.dart';
import '../../../auth/presentation/screens/account/auth_sessions_screen.dart';
import '../widgets/settings_section_header.dart';
import '../widgets/settings_tile.dart';

class PrivacySecurityScreen extends StatelessWidget {
  const PrivacySecurityScreen({super.key});

  static const String name = 'privacy-security';
  static const String path = '/privacy-security';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

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
        title: Text(
          l10n.privacySecurity,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.w),
        children: [
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
                SettingsTile(
                  title: l10n.activeSessions,
                  onTap: () {
                    context.push(AuthSessionsScreen.path);
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  title: l10n.devices,
                  onTap: () {
                    context.push(AuthDevicesScreen.path);
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
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
                    context.push(AuthPrivacyScreen.path);
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  title: l10n.requestAccountDeletion,
                  onTap: () {
                    context.push(AuthPrivacyScreen.path);
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
