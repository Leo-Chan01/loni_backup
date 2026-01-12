import '../models/notification_model.dart';
import '../repository/notifications_repository.dart';

class ListNotificationsUseCase {
  const ListNotificationsUseCase(this._repository);

  final NotificationsRepository _repository;

  Future<List<AppNotification>> call({int limit = 50}) {
    return _repository.listNotifications(limit: limit);
  }
}
