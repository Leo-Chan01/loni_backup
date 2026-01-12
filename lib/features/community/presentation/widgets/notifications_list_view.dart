import 'package:flutter/material.dart';

import '../../domain/models/notification_model.dart';
import 'notification_item.dart';
import 'notifications_empty_state.dart';

class NotificationsListView extends StatelessWidget {
  const NotificationsListView({
    super.key,
    required this.notifications,
    required this.onNotificationTap,
  });

  final List<AppNotification> notifications;
  final ValueChanged<AppNotification> onNotificationTap;

  @override
  Widget build(BuildContext context) {
    if (notifications.isEmpty) {
      return const NotificationsEmptyState();
    }

    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return NotificationItem(
          notification: notification,
          onTap: () => onNotificationTap(notification),
        );
      },
    );
  }
}
