import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/utilities/localization_extension.dart';
import '../../../community/domain/models/notification_model.dart';
import '../widgets/notification_item.dart';

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

  final List<AppNotification> mockNotifications = [
    AppNotification(
      id: '1',
      type: NotificationType.follow,
      userId: '1',
      userFullName: 'Kwame Mensah',
      message: 'started following you',
      createdAt: DateTime.now().subtract(const Duration(minutes: 30)),
    ),
    AppNotification(
      id: '2',
      type: NotificationType.like,
      userId: '2',
      userFullName: 'Zara Okafor',
      message: 'liked your post',
      createdAt: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    AppNotification(
      id: '3',
      type: NotificationType.comment,
      userId: '3',
      userFullName: 'Chidi Nkosi',
      message: 'commented on your post',
      isRead: true,
      createdAt: DateTime.now().subtract(const Duration(hours: 3)),
    ),
    AppNotification(
      id: '4',
      type: NotificationType.mention,
      userId: '4',
      userFullName: 'Amara Okonkwo',
      message: 'mentioned you in a post',
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    AppNotification(
      id: '5',
      type: NotificationType.newBook,
      userId: '5',
      userFullName: 'System',
      message: 'New book added to Fiction',
      isRead: true,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    AppNotification(
      id: '6',
      type: NotificationType.achievement,
      userId: '6',
      userFullName: 'System',
      message: 'Achievement unlocked: 50 Books Read!',
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
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
          TextButton(
            onPressed: () {},
            child: Text(
              context.l10n.markAllRead,
              style: TextStyle(
                color: colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
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
            Tab(text: 'Likes'),
            Tab(text: 'Comments'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView.builder(
            itemCount: mockNotifications.length,
            itemBuilder: (context, index) {
              return NotificationItem(notification: mockNotifications[index]);
            },
          ),
          ListView.builder(
            itemCount: mockNotifications
                .where((n) => n.type == NotificationType.mention)
                .length,
            itemBuilder: (context, index) {
              final mentions = mockNotifications
                  .where((n) => n.type == NotificationType.mention)
                  .toList();
              return NotificationItem(notification: mentions[index]);
            },
          ),
          ListView.builder(
            itemCount: mockNotifications
                .where((n) => n.type == NotificationType.like)
                .length,
            itemBuilder: (context, index) {
              final likes = mockNotifications
                  .where((n) => n.type == NotificationType.like)
                  .toList();
              return NotificationItem(notification: likes[index]);
            },
          ),
          ListView.builder(
            itemCount: mockNotifications
                .where((n) => n.type == NotificationType.comment)
                .length,
            itemBuilder: (context, index) {
              final comments = mockNotifications
                  .where((n) => n.type == NotificationType.comment)
                  .toList();
              return NotificationItem(notification: comments[index]);
            },
          ),
        ],
      ),
    );
  }
}
