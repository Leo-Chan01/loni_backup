import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

import '../../../../core/utilities/localization_extension.dart';
import '../../../auth/presentation/screens/account/auth_consents_screen.dart';
import '../../../auth/presentation/screens/account/auth_devices_screen.dart';
import '../../../auth/presentation/screens/account/auth_parental_controls_screen.dart';
import '../../../auth/presentation/screens/account/auth_preferences_screen.dart';
import '../../../auth/presentation/screens/account/auth_purchases_screen.dart';
import '../../../auth/presentation/provider/auth_provider.dart';
import '../../../profile/presentation/screens/edit_profile_screen.dart';
import '../widgets/settings_section_header.dart';
import '../widgets/settings_tile.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  static const String name = 'account-settings';
  static const String path = '/account-settings';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final authProvider = context.watch<AuthProvider>();
    final user = authProvider.session?.user;
    final userDisplayName = user?.displayName.isNotEmpty == true
        ? user!.displayName
        : l10n.notAvailable;
    final userEmail = user?.email?.isNotEmpty == true ? user!.email! : l10n.notAvailable;
    final userPhone = user?.phone?.isNotEmpty == true ? user!.phone! : l10n.notAvailable;

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
          l10n.accountSettings,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.w),
        children: [
          SettingsSectionHeader(title: l10n.personalInformation),
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
                  title: l10n.fullName,
                  subtitle: userDisplayName,
                  onTap: () {
                    context.push(EditProfileScreen.path);
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  title: l10n.emailLabel,
                  subtitle: userEmail,
                  onTap: () {
                    context.push(EditProfileScreen.path);
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  title: l10n.phoneNumber,
                  subtitle: userPhone,
                  onTap: () {
                    context.push(EditProfileScreen.path);
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),

          SettingsSectionHeader(title: l10n.accountManagement),
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
                  title: l10n.authPreferences,
                  onTap: () {
                    context.push(AuthPreferencesScreen.path);
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  title: l10n.authConsents,
                  onTap: () {
                    context.push(AuthConsentsScreen.path);
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  title: l10n.parentalControls,
                  onTap: () {
                    context.push(AuthParentalControlsScreen.path);
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
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  title: l10n.purchaseHistory,
                  onTap: () {
                    context.push(AuthPurchasesScreen.path);
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
