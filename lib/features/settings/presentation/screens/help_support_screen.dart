import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/models/contact_info_model.dart';
import '../../domain/models/help_topic_model.dart';
import '../widgets/quick_action_button.dart';
import '../widgets/settings_section_header.dart';
import '../widgets/settings_tile.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  static const String name = 'help-support';
  static const String path = '/help-support';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    final contactInfo = ContactInfo(
      email: l10n.supportEmail,
      phone: l10n.supportPhone,
      hours: l10n.supportHours,
    );

    final popularTopics = [
      HelpTopic(id: '1', title: l10n.howToDownloadBooks, iconName: 'book'),
      HelpTopic(
        id: '2',
        title: l10n.paymentMethodsHelp,
        iconName: 'credit-card',
      ),
      HelpTopic(id: '3', title: l10n.refundPolicy, iconName: 'undo'),
      HelpTopic(id: '4', title: l10n.premiumSubscription, iconName: 'crown'),
      HelpTopic(id: '5', title: l10n.shippingDelivery, iconName: 'truck'),
    ];

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
          l10n.helpSupport,
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
          // Search Help
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
                Row(
                  children: [
                    Container(
                      width: 48.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorScheme.primary.withValues(alpha: 0.1),
                      ),
                      child: Center(
                        child: HugeIcon(
                          icon: HugeIcons.strokeRoundedSearch01,
                          color: colorScheme.primary,
                          size: 24.sp,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.searchHelpArticles,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            l10n.findAnswers,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: colorScheme.onSurface.withValues(
                                alpha: 0.6,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                TextField(
                  decoration: InputDecoration(
                    hintText: l10n.whatCanWeHelp,
                    hintStyle: TextStyle(
                      color: colorScheme.onSurface.withValues(alpha: 0.4),
                    ),
                    filled: true,
                    fillColor: colorScheme.surfaceContainerHighest,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),

          // Quick Actions
          SettingsSectionHeader(title: l10n.quickActions),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 12.h,
            crossAxisSpacing: 12.w,
            childAspectRatio: 1.2,
            children: [
              QuickActionButton(
                icon: Icons.chat_bubble_outline,
                iconColor: Colors.blue,
                label: l10n.liveChat,
                onTap: () {
                  // Open live chat
                },
              ),
              QuickActionButton(
                icon: Icons.email_outlined,
                iconColor: Colors.green,
                label: l10n.emailUs,
                onTap: () {
                  // Open email
                },
              ),
              QuickActionButton(
                icon: Icons.phone_outlined,
                iconColor: Colors.purple,
                label: l10n.callSupport,
                onTap: () {
                  // Open phone
                },
              ),
              QuickActionButton(
                icon: Icons.menu_book_outlined,
                iconColor: Colors.yellow.shade700,
                label: l10n.userGuide,
                onTap: () {
                  // Open user guide
                },
              ),
            ],
          ),
          SizedBox(height: 24.h),

          // Popular Topics
          SettingsSectionHeader(title: l10n.popularTopics),
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
                for (int i = 0; i < popularTopics.length; i++) ...[
                  if (i > 0)
                    Divider(
                      height: 1,
                      color: colorScheme.outline.withValues(alpha: 0.1),
                    ),
                  SettingsTile(
                    leadingIcon: Icon(
                      _getIconForTopic(popularTopics[i].iconName),
                      size: 20.sp,
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                    title: popularTopics[i].title,
                    onTap: () {
                      // Open topic details
                    },
                  ),
                ],
              ],
            ),
          ),
          SizedBox(height: 24.h),

          // Contact Information
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
                  l10n.contactInformation,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedMail01,
                      color: colorScheme.primary,
                      size: 20.sp,
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      contactInfo.email,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedCall,
                      color: colorScheme.primary,
                      size: 20.sp,
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      contactInfo.phone,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedClock01,
                      color: colorScheme.primary,
                      size: 20.sp,
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      contactInfo.hours,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconForTopic(String iconName) {
    switch (iconName) {
      case 'book':
        return Icons.menu_book;
      case 'credit-card':
        return Icons.credit_card;
      case 'undo':
        return Icons.undo;
      case 'crown':
        return Icons.workspace_premium;
      case 'truck':
        return Icons.local_shipping;
      default:
        return Icons.help_outline;
    }
  }
}
