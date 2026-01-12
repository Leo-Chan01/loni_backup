import 'package:flutter/foundation.dart';

import 'package:loni_africa/core/network/api_exception.dart';

import '../../domain/models/notification_model.dart';
import '../../domain/usecases/list_notifications_usecase.dart';
import '../../domain/usecases/mark_all_notifications_read_usecase.dart';
import '../../domain/usecases/mark_notification_read_usecase.dart';

class NotificationsProvider extends ChangeNotifier {
  NotificationsProvider({
    required ListNotificationsUseCase listNotifications,
    required MarkNotificationReadUseCase markNotificationRead,
    required MarkAllNotificationsReadUseCase markAllNotificationsRead,
  }) : _listNotifications = listNotifications,
       _markNotificationRead = markNotificationRead,
       _markAllNotificationsRead = markAllNotificationsRead;

  final ListNotificationsUseCase _listNotifications;
  final MarkNotificationReadUseCase _markNotificationRead;
  final MarkAllNotificationsReadUseCase _markAllNotificationsRead;

  List<AppNotification> _notifications = const <AppNotification>[];
  bool _isLoading = false;
  bool _isMarkingAllRead = false;
  String? _errorMessage;

  List<AppNotification> get notifications => _notifications;
  bool get isLoading => _isLoading;
  bool get isMarkingAllRead => _isMarkingAllRead;
  String? get errorMessage => _errorMessage;

  Future<void> fetch({bool force = false, int limit = 50}) async {
    if (!force && _notifications.isNotEmpty) {
      return;
    }

    _setLoading(true);
    try {
      _notifications = await _listNotifications(limit: limit);
      _errorMessage = null;
    } on ApiException catch (error) {
      _errorMessage = _preferredErrorMessage(error);
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _setLoading(false);
    }
  }

  Future<void> markRead(String notificationId) async {
    final index = _notifications.indexWhere((n) => n.id == notificationId);
    if (index == -1) return;

    final current = _notifications[index];
    if (current.isRead) return;

    _notifications = List<AppNotification>.from(_notifications);
    _notifications[index] = AppNotification(
      id: current.id,
      type: current.type,
      title: current.title,
      body: current.body,
      data: current.data,
      isRead: true,
      createdAt: current.createdAt,
    );
    notifyListeners();

    try {
      await _markNotificationRead(notificationId);
    } on ApiException catch (error) {
      _errorMessage = _preferredErrorMessage(error);
      _notifications = List<AppNotification>.from(_notifications);
      _notifications[index] = current;
      notifyListeners();
      rethrow;
    } catch (error) {
      _errorMessage = error.toString();
      _notifications = List<AppNotification>.from(_notifications);
      _notifications[index] = current;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> markAllRead() async {
    if (_isMarkingAllRead) return;

    _setMarkingAllRead(true);

    final previous = _notifications;
    _notifications = _notifications
        .map(
          (n) => n.isRead
              ? n
              : AppNotification(
                  id: n.id,
                  type: n.type,
                  title: n.title,
                  body: n.body,
                  data: n.data,
                  isRead: true,
                  createdAt: n.createdAt,
                ),
        )
        .toList();
    notifyListeners();

    try {
      await _markAllNotificationsRead();
      _errorMessage = null;
    } on ApiException catch (error) {
      _errorMessage = _preferredErrorMessage(error);
      _notifications = previous;
      notifyListeners();
      rethrow;
    } catch (error) {
      _errorMessage = error.toString();
      _notifications = previous;
      notifyListeners();
      rethrow;
    } finally {
      _setMarkingAllRead(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setMarkingAllRead(bool value) {
    _isMarkingAllRead = value;
    notifyListeners();
  }

  String _preferredErrorMessage(ApiException error) {
    final detailsMessage = error.details?['message'];
    if (detailsMessage != null && detailsMessage.toString().isNotEmpty) {
      return detailsMessage.toString();
    }
    return error.message;
  }
}
