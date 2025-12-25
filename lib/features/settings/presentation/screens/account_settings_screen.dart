import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/settings_section_header.dart';
import '../widgets/settings_tile.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  static const String name = 'account-settings';
  static const String path = '/account-settings';

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
          l10n.accountSettings,
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
          // Personal Information
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
                  subtitle: 'John Mensah',
                  onTap: () {
                    // Edit full name
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  title: l10n.emailLabel,
                  subtitle: 'john.mensah@email.com',
                  onTap: () {
                    // Edit email
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  title: l10n.phoneNumber,
                  subtitle: '+233 24 123 4567',
                  onTap: () {
                    // Edit phone
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  title: l10n.dateOfBirth,
                  subtitle: 'March 15, 1990',
                  onTap: () {
                    // Edit date of birth
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),

          // Account Management
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
                  title: l10n.changePassword,
                  onTap: () {
                    // Navigate to change password
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  title: l10n.connectedAccounts,
                  onTap: () {
                    // Navigate to connected accounts
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  title: l10n.paymentMethods,
                  onTap: () {
                    // Navigate to payment methods
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  title: l10n.subscription,
                  trailing: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      l10n.premium,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                  onTap: () {
                    // Navigate to subscription
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),

          // Danger Zone
          SettingsSectionHeader(title: l10n.dangerZone),
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
                  title: l10n.deactivateAccount,
                  onTap: () {
                    // Show deactivate confirmation
                  },
                  trailing: Icon(
                    Icons.chevron_right,
                    size: 20.sp,
                    color: Colors.red.withValues(alpha: 0.6),
                  ),
                  showChevron: false,
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  title: l10n.deleteAccount,
                  onTap: () {
                    // Show delete confirmation
                  },
                  trailing: Icon(
                    Icons.chevron_right,
                    size: 20.sp,
                    color: Colors.red.withValues(alpha: 0.6),
                  ),
                  showChevron: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
