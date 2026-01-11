import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

import '../../../../core/utilities/localization_extension.dart';
import '../../../../features/auth/presentation/provider/auth_provider.dart';
import '../../../../shared/widgets/global_snackbar.dart';
import '../widgets/profile_preview_card.dart';
import '../widgets/settings_section_header.dart';
import '../widgets/settings_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const String name = 'settings';
  static const String path = '/settings';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final authProvider = context.watch<AuthProvider>();
    final user = authProvider.session?.user;
    final userDisplayName = user?.displayName.isNotEmpty == true
      ? user!.displayName
      : l10n.notAvailable;
    final userEmailOrPhone =
      (user?.email?.isNotEmpty == true ? user!.email : user?.phone) ??
        l10n.notAvailable;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: HugeIcon(
            icon: HugeIcons.strokeRoundedArrowLeft01,
            color: colorScheme.onSurface,
            size: 24.sp,
          ),
        ),
        title: Text(
          l10n.settings,
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
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
            fullName: authProvider.isInitializing ? l10n.loading : userDisplayName,
            email: authProvider.isInitializing ? l10n.loading : userEmailOrPhone,
            avatarUrl: user?.photoUrl,
            viewProfileText: l10n.viewProfile,
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
                      color: colorScheme.secondary.withValues(alpha: 0.1),
                    ),
                    child: Center(
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedShieldUser,
                        color: colorScheme.secondary,
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
                      color: colorScheme.tertiary.withValues(alpha: 0.1),
                    ),
                    child: Center(
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedNotification02,
                        color: colorScheme.tertiary,
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
                      color: colorScheme.secondary.withValues(alpha: 0.1),
                    ),
                    child: Center(
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedSettings01,
                        color: colorScheme.secondary,
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
                      color: colorScheme.tertiary.withValues(alpha: 0.1),
                    ),
                    child: Center(
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedDownload01,
                        color: colorScheme.tertiary,
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
                      color: colorScheme.error.withValues(alpha: 0.1),
                    ),
                    child: Center(
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedTranslate,
                        color: colorScheme.error,
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
                      color: colorScheme.secondary.withValues(alpha: 0.1),
                    ),
                    child: Center(
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedHelpCircle,
                        color: colorScheme.secondary,
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
                      color: colorScheme.tertiary.withValues(alpha: 0.1),
                    ),
                    child: Center(
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedInformationCircle,
                        color: colorScheme.tertiary,
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
                _showLogoutConfirmation(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.error.withValues(alpha: 0.1),
                foregroundColor: colorScheme.error,
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              child: Text(
                l10n.logOut,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showLogoutConfirmation(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        final l10n = context.l10n;
        final colorScheme = Theme.of(dialogContext).colorScheme;
        return AlertDialog(
          title: Text(l10n.logOut),
          content: Text('${l10n.logOut}?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: Text(l10n.cancel),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(dialogContext);
                await _handleLogout(context);
              },
              child: Text(
                l10n.logOut,
                style: TextStyle(color: colorScheme.error),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _handleLogout(BuildContext context) async {
    try {
      final authProvider = context.read<AuthProvider>();
      await authProvider.signOut();

      if (!context.mounted) return;

      GlobalSnackBar.showSuccess(context.l10n.success);
      context.go('/login');
    } catch (error) {
      if (!context.mounted) return;

      GlobalSnackBar.showError(
        error.toString().isNotEmpty
            ? error.toString()
            : context.l10n.error,
      );
    }
  }
}