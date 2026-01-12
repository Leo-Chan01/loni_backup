import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

import '../../../../core/utilities/localization_extension.dart';
import '../../../../shared/widgets/global_snackbar.dart';
import '../../domain/models/notification_model.dart';
import '../provider/notifications_provider.dart';
import '../widgets/notifications_tab.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  static const String path = '/notifications';
  static const String name = 'NotificationsScreen';

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NotificationsProvider>().fetch();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft01),
          onPressed: () => context.pop(),
        ),
        title: Text(context.l10n.notifications),
        actions: [
          Consumer<NotificationsProvider>(
            builder: (context, provider, _) {
              return TextButton(
                onPressed: provider.isMarkingAllRead
                    ? null
                    : () async {
                        final notificationsProvider = context
                            .read<NotificationsProvider>();
                        final successText = context.l10n.success;
                        final fallbackErrorText = context.l10n.error;

                        try {
                          await notificationsProvider.markAllRead();
                          GlobalSnackBar.showSuccess(successText);
                        } catch (_) {
                          final message = notificationsProvider.errorMessage;
                          GlobalSnackBar.showError(
                            message?.isNotEmpty == true
                                ? message!
                                : fallbackErrorText,
                          );
                        }
                      },
                child: Text(
                  context.l10n.markAllRead,
                  style: TextStyle(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: colorScheme.primary,
          unselectedLabelColor: colorScheme.onSurface.withValues(alpha: 0.6),
          indicatorColor: colorScheme.primary,
          isScrollable: true,
          tabs: [
            Tab(text: context.l10n.all),
            Tab(text: context.l10n.mentions),
            Tab(text: context.l10n.likesTab),
            Tab(text: context.l10n.commentsTab),
          ],
        ),
      ),
      body: Consumer<NotificationsProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final notifications = provider.notifications;
          final mentions = notifications
              .where((n) => n.type == NotificationType.mention)
              .toList();
          final likes = notifications
              .where((n) => n.type == NotificationType.like)
              .toList();
          final comments = notifications
              .where((n) => n.type == NotificationType.comment)
              .toList();

          return TabBarView(
            controller: _tabController,
            children: [
              NotificationsTab(notifications: notifications),
              NotificationsTab(notifications: mentions),
              NotificationsTab(notifications: likes),
              NotificationsTab(notifications: comments),
            ],
          );
        },
      ),
    );
  }
}
