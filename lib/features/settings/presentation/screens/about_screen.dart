import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/models/app_info_model.dart';
import '../widgets/settings_section_header.dart';
import '../widgets/settings_tile.dart';
import '../widgets/social_media_button.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const String name = 'about';
  static const String path = '/about';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    final appInfo = AppInfo(
      appName: 'Loni',
      version: '2.4.1',
      copyright: l10n.copyright,
      missionStatement: l10n.missionStatement,
    );

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
            color: colorScheme.onSurface,
          ),
        ),
        title: Text(
          l10n.aboutLoni,
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
          // App Info
          Column(
            children: [
              Container(
                width: 96.w,
                height: 96.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                  gradient: LinearGradient(
                    colors: [
                      colorScheme.primary,
                      colorScheme.secondary,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.primary.withValues(alpha: 0.3),
                      blurRadius: 20.r,
                      offset: Offset(0, 8.h),
                    ),
                  ],
                ),
                child: Center(
                  child: HugeIcon(
                    icon: HugeIcons.strokeRoundedBook02,
                    color: Colors.white,
                    size: 48.sp,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                appInfo.appName,
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Merriweather',
                  color: colorScheme.onSurface,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                '${l10n.version} ${appInfo.version}',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                appInfo.copyright,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),

          // Mission
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              border: Border.all(
                color: colorScheme.outline.withValues(alpha: 0.2),
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.ourMission,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  appInfo.missionStatement,
                  style: TextStyle(
                    fontSize: 14.sp,
                    height: 1.5,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),

          // App Information
          SettingsSectionHeader(title: l10n.appInformation),
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
                  title: l10n.whatsNew,
                  onTap: () {
                    // Show what's new
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  title: l10n.releaseNotes,
                  onTap: () {
                    // Show release notes
                  },
                ),
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.1),
                ),
                SettingsTile(
                  title: l10n.licenses,
                  onTap: () {
                    // Show licenses
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),

          // Legal
          SettingsSectionHeader(title: l10n.legal),
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
                  title: l10n.termsOfService,
                  onTap: () {
                    // Open terms
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
                  title: l10n.cookiePolicy,
                  onTap: () {
                    // Open cookie policy
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),

          // Social Media
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              border: Border.all(
                color: colorScheme.outline.withValues(alpha: 0.2),
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                Text(
                  l10n.followUs,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaButton(
                      icon: Icons.facebook_outlined,
                      onTap: () {
                        // Open Facebook
                      },
                    ),
                    SizedBox(width: 16.w),
                    SocialMediaButton(
                      icon: Icons.alternate_email,
                      onTap: () {
                        // Open Twitter
                      },
                    ),
                    SizedBox(width: 16.w),
                    SocialMediaButton(
                      icon: Icons.camera_alt_outlined,
                      onTap: () {
                        // Open Instagram
                      },
                    ),
                    SizedBox(width: 16.w),
                    SocialMediaButton(
                      icon: Icons.work_outline,
                      onTap: () {
                        // Open LinkedIn
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),

          // Rate App Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Open app store rating
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              child: Text(
                l10n.rateLoniOnAppStore,
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
