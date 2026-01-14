import 'package:dio/dio.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/utilities/device_info_service.dart';
import '../../../../core/utilities/json_map.dart';

class AuthAccountService {
  AuthAccountService({
    Dio? dio,
    DeviceInfoService? deviceInfoService,
  }) : _dio = dio ?? ApiClient.instance.dio,
       _deviceInfoService = deviceInfoService ?? DeviceInfoService();

  final Dio _dio;
  final DeviceInfoService _deviceInfoService;

  Future<JsonMap> getPreferences() async {
    return _getJson('/auth/preferences');
  }

  Future<JsonMap> updatePreferences(JsonMap preferences) async {
    return _putJson('/auth/preferences', data: preferences);
  }

  Future<JsonMap> getConsents() async {
    return _getJson('/auth/consents');
  }

  Future<JsonMap> updateConsents(JsonMap consents) async {
    return _patchJson('/auth/consents', data: consents);
  }

  Future<JsonMap> getParentalControls() async {
    return _getJson('/auth/parental-controls');
  }

  Future<JsonMap> updateParentalControls(JsonMap parentalControls) async {
    return _patchJson('/auth/parental-controls', data: parentalControls);
  }

  Future<List<JsonMap>> listSessions() async {
    final data = await _getAny('/auth/sessions');
    return _coerceToList(data);
  }

  Future<void> deleteSession(String id) async {
    try {
      await _dio.delete('/auth/sessions/$id');
    } on DioException catch (error) {
      throw ApiException.fromDioException(error);
    }
  }

  Future<List<JsonMap>> listDevices() async {
    final data = await _getAny('/auth/devices');
    return _coerceToList(data);
  }

  Future<JsonMap> registerCurrentDevice() async {
    final device = await _deviceInfoService.getDeviceInfo();
    return _postJson('/auth/devices', data: device.toJson());
  }

  Future<void> deleteDevice(String id) async {
    try {
      await _dio.delete('/auth/devices/$id');
    } on DioException catch (error) {
      throw ApiException.fromDioException(error);
    }
  }

  Future<List<JsonMap>> listPurchases() async {
    final data = await _getAny('/auth/purchases');
    return _coerceToList(data);
  }

  Future<JsonMap> requestPrivacyExport() async {
    return _postJson('/auth/privacy/export');
  }

  Future<JsonMap> requestPrivacyDelete() async {
    return _postJson('/auth/privacy/delete');
  }

  Future<Object?> _getAny(String path) async {
    try {
      final response = await _dio.get(path);
      return response.data;
    } on DioException catch (error) {
      throw ApiException.fromDioException(error);
    }
  }

  Future<JsonMap> _getJson(String path) async {
    final data = await _getAny(path);
    if (data is JsonMap) {
      return data;
    }
    throw ApiException(message: 'Unexpected response from server.');
  }

  Future<JsonMap> _postJson(String path, {Object? data}) async {
    try {
      final response = await _dio.post(path, data: data);
      final body = response.data;
      if (body is JsonMap) return body;
      if (body == null) return <String, dynamic>{};
      return <String, dynamic>{'data': body};
    } on DioException catch (error) {
      throw ApiException.fromDioException(error);
    }
  }

  Future<JsonMap> _putJson(String path, {Object? data}) async {
    try {
      final response = await _dio.put(path, data: data);
      final body = response.data;
      if (body is JsonMap) return body;
      if (body == null) return <String, dynamic>{};
      return <String, dynamic>{'data': body};
    } on DioException catch (error) {
      throw ApiException.fromDioException(error);
    }
  }

  Future<JsonMap> _patchJson(String path, {Object? data}) async {
    try {
      final response = await _dio.patch(path, data: data);
      final body = response.data;
      if (body is JsonMap) return body;
      if (body == null) return <String, dynamic>{};
      return <String, dynamic>{'data': body};
    } on DioException catch (error) {
      throw ApiException.fromDioException(error);
    }
  }

  List<JsonMap> _coerceToList(Object? data) {
    if (data is List) {
      return data
          .whereType<Object?>()
          .map((e) => e is JsonMap ? e : <String, dynamic>{'value': e})
          .toList(growable: false);
    }

    if (data is JsonMap) {
      final items = data['items'] ?? data['data'] ?? data['results'];
      if (items is List) {
        return items
            .whereType<Object?>()
            .map((e) => e is JsonMap ? e : <String, dynamic>{'value': e})
            .toList(growable: false);
      }
      return [data];
    }

    if (data == null) return const [];
    return [<String, dynamic>{'value': data}];
  }
}
