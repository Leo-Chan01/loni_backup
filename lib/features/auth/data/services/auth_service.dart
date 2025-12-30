import 'package:dio/dio.dart';
import 'package:loni_africa/core/network/api_client.dart';
import 'package:loni_africa/core/network/api_exception.dart';
import 'package:loni_africa/core/utilities/device_info_service.dart';
import 'package:loni_africa/features/auth/data/models/auth_session_model.dart';

class AuthService {
  AuthService({Dio? dio, DeviceInfoService? deviceInfoService})
    : _dio = dio ?? ApiClient.instance.dio,
      _deviceInfoService = deviceInfoService ?? DeviceInfoService();

  final Dio _dio;
  final DeviceInfoService _deviceInfoService;

  Future<AuthSessionModel> signInWithPassword({
    required String identifier,
    required String password,
  }) async {
    final device = await _deviceInfoService.getDeviceInfo();
    final payload = {
      'identifier': identifier.trim(),
      'password': password,
      'device': device.toJson(),
    };

    return _postLogin(payload);
  }

  Future<AuthSessionModel> signInWithOtp({
    required String identifier,
    required String otpCode,
  }) async {
    final device = await _deviceInfoService.getDeviceInfo();
    final payload = {
      'identifier': identifier.trim(),
      'otpCode': otpCode.trim(),
      'device': device.toJson(),
    };

    return _postLogin(payload);
  }

  Future<void> sendOtp({required String identifier}) async {
    try {
      await _dio.post(
        '/auth/otp/send',
        data: {'identifier': identifier.trim()},
      );
    } on DioException catch (error) {
      throw ApiException.fromDioException(error);
    }
  }

  Future<AuthSessionModel> _postLogin(Map<String, dynamic> payload) async {
    try {
      final response = await _dio.post('/auth/login', data: payload);
      final data = response.data as Map<String, dynamic>;
      return AuthSessionModel.fromJson(data);
    } on DioException catch (error) {
      throw ApiException.fromDioException(error);
    }
  }
}
