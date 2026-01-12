import '../repository/notifications_repository.dart';

class MarkNotificationReadUseCase {
  const MarkNotificationReadUseCase(this._repository);

  final NotificationsRepository _repository;

  Future<void> call(String notificationId) {
    return _repository.markRead(notificationId);
  }
}
