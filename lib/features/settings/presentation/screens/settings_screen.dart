import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/profile_preview_card.dart';
import '../widgets/settings_section_header.dart';
import '../widgets/settings_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const String name = 'settings';
  static const String path = '/settings';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        title: Text(
          l10n.settings,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            fontFamily: 'Merriweather',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Search functionality
            },
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedSearch01,
              color: colorScheme.onSurface,
              size: 24.sp,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20.w),
        children: [
          // Profile Preview Card
          ProfilePreviewCard(
            fullName: 'John Mensah',
            email: 'john.mensah@email.com',
            avatarUrl:
                'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=200&auto=format&fit=crop',
            onTap: () {
              // Navigate to profile
            },
            onViewProfile: () {
              // Navigate to profile
            },
          ),
          SizedBox(height: 24.h),

          // Account Section
          SettingsSectionHeader(title: l10n.account),
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
                  leadingIcon: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorScheme.primary.withValues(alpha: 0.1),
                    ),
                    child: Center(
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedUser,
                        color: colorScheme.primary,
                        size: 20.sp,
                      ),
                    ),
                  ),
                  title: l10n.accountSettings,
                  onTap: () {
                    // Navigate to account settings
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  leadingIcon: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue.withValues(alpha: 0.1),
                    ),
                    child: Center(
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedShieldUser,
                        color: Colors.blue,
                        size: 20.sp,
                      ),
                    ),
                  ),
                  title: l10n.privacySecurity,
                  onTap: () {
                    // Navigate to privacy settings
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  leadingIcon: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green.withValues(alpha: 0.1),
                    ),
                    child: Center(
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedNotification02,
                        color: Colors.green,
                        size: 20.sp,
                      ),
                    ),
                  ),
                  title: l10n.notifications,
                  onTap: () {
                    // Navigate to notifications settings
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),

          // App Section
          SettingsSectionHeader(title: l10n.app),
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
                  leadingIcon: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.purple.withValues(alpha: 0.1),
                    ),
                    child: Center(
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedSettings01,
                        color: Colors.purple,
                        size: 20.sp,
                      ),
                    ),
                  ),
                  title: l10n.appPreferences,
                  onTap: () {
                    // Navigate to app preferences
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  leadingIcon: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow.shade700.withValues(alpha: 0.1),
                    ),
                    child: Center(
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedDownload01,
                        color: Colors.yellow.shade700,
                        size: 20.sp,
                      ),
                    ),
                  ),
                  title: l10n.storageDownloads,
                  onTap: () {
                    // Navigate to storage settings
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  leadingIcon: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red.withValues(alpha: 0.1),
                    ),
                    child: Center(
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedTranslate,
                        color: Colors.red,
                        size: 20.sp,
                      ),
                    ),
                  ),
                  title: l10n.languageRegion,
                  onTap: () {
                    // Navigate to language settings
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),

          // Support Section
          SettingsSectionHeader(title: l10n.support),
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
                  leadingIcon: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.teal.withValues(alpha: 0.1),
                    ),
                    child: Center(
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedHelpCircle,
                        color: Colors.teal,
                        size: 20.sp,
                      ),
                    ),
                  ),
                  title: l10n.helpSupport,
                  onTap: () {
                    // Navigate to help
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  leadingIcon: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.indigo.withValues(alpha: 0.1),
                    ),
                    child: Center(
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedInformationCircle,
                        color: Colors.indigo,
                        size: 20.sp,
                      ),
                    ),
                  ),
                  title: l10n.aboutLoni,
                  onTap: () {
                    // Navigate to about
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),

          // Logout Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Handle logout
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.withValues(alpha: 0.1),
                foregroundColor: Colors.red,
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              child: Text(
                l10n.logOut,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
