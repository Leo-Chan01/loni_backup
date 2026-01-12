import '../../domain/models/notification_model.dart';
import '../../domain/repository/notifications_repository.dart';
import '../services/notifications_api_service.dart';

class NotificationsRepositoryImpl implements NotificationsRepository {
  NotificationsRepositoryImpl({NotificationsApiService? apiService})
    : _apiService = apiService ?? NotificationsApiService();

  final NotificationsApiService _apiService;

  @override
  Future<List<AppNotification>> listNotifications({int limit = 50}) async {
    final dtos = await _apiService.listNotifications(limit: limit);

    final notifications = dtos
        .map(
          (dto) => AppNotification(
            id: dto.id,
            type: _parseType(dto.type),
            title: dto.title,
            body: dto.body,
            data: dto.data,
            isRead: dto.readAt != null,
            createdAt: dto.createdAt,
          ),
        )
        .toList();

    notifications.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return notifications;
  }

  @override
  Future<void> markRead(String notificationId) {
    return _apiService.markRead(notificationId);
  }

  @override
  Future<void> markAllRead() {
    return _apiService.markAllRead();
  }

  NotificationType _parseType(String raw) {
    final normalized = raw.trim().toLowerCase();

    switch (normalized) {
      case 'follow':
        return NotificationType.follow;
      case 'like':
        return NotificationType.like;
      case 'comment':
        return NotificationType.comment;
      case 'reply':
        return NotificationType.reply;
      case 'mention':
        return NotificationType.mention;
      case 'new_book':
      case 'newbook':
      case 'book':
        return NotificationType.newBook;
      case 'discussion':
        return NotificationType.discussion;
      case 'achievement':
        return NotificationType.achievement;
      case 'sale':
        return NotificationType.sale;
      case 'order_shipped':
      case 'ordershipped':
        return NotificationType.orderShipped;
      case 'payment_confirmed':
      case 'paymentconfirmed':
        return NotificationType.paymentConfirmed;
      default:
        return NotificationType.generic;
    }
  }
}
