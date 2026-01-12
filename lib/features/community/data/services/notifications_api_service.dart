import 'package:dio/dio.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_exception.dart';
import '../models/api_notification_dto.dart';

class NotificationsApiService {
  NotificationsApiService({Dio? dio}) : _dio = dio ?? ApiClient.instance.dio;

  final Dio _dio;

  Future<List<ApiNotificationDto>> listNotifications({int limit = 50}) async {
    try {
      final response = await _dio.get(
        '/notifications',
        queryParameters: {'limit': limit},
      );

      final data = response.data;
      if (data is! List) {
        throw ApiException(message: 'Unexpected response from server.');
      }

      return data
          .whereType<Map>()
          .map((e) => e.map((k, v) => MapEntry(k.toString(), v)))
          .map(ApiNotificationDto.fromJson)
          .toList();
    } on DioException catch (error) {
      throw ApiException.fromDioException(error);
    }
  }

  Future<void> markRead(String notificationId) async {
    try {
      await _dio.post('/notifications/$notificationId/read');
    } on DioException catch (error) {
      throw ApiException.fromDioException(error);
    }
  }

  Future<void> markAllRead() async {
    try {
      await _dio.post('/notifications/read-all');
    } on DioException catch (error) {
      throw ApiException.fromDioException(error);
    }
  }
}
