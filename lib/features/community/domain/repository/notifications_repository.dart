import '../models/notification_model.dart';

abstract class NotificationsRepository {
  Future<List<AppNotification>> listNotifications({int limit = 50});

  Future<void> markRead(String notificationId);

  Future<void> markAllRead();
}
