import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utilities/localization_extension.dart';
import '../../../../shared/widgets/global_snackbar.dart';
import '../../domain/models/notification_model.dart';
import '../provider/notifications_provider.dart';
import 'notifications_list_view.dart';

class NotificationsTab extends StatelessWidget {
  const NotificationsTab({super.key, required this.notifications});

  final List<AppNotification> notifications;

  @override
  Widget build(BuildContext context) {
    return NotificationsListView(
      notifications: notifications,
      onNotificationTap: (n) async {
        final notificationsProvider = context.read<NotificationsProvider>();
        final fallbackErrorText = context.l10n.error;

        try {
          await notificationsProvider.markRead(n.id);
        } catch (_) {
          final message = notificationsProvider.errorMessage;
          GlobalSnackBar.showError(
            message?.isNotEmpty == true ? message! : fallbackErrorText,
          );
        }
      },
    );
  }
}
