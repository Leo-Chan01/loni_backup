// ignore_for_file: avoid_print

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

  Future<AuthSessionModel> signUpWithPassword({
    required String email,
    required String password,
    required String fullName,
  }) async {
    final device = await _deviceInfoService.getDeviceInfo();
    
    // Split full name into first and last name
    final nameParts = fullName.trim().split(' ');
    final firstName = nameParts.first;
    final lastName = nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';
    
    final payload = {
      'email': email.trim(),
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'accountType': 'reader',
      'device': device.toJson(),
    };

    try {
      print('📤 Sending signup request to /auth/signup');
      print('   Email: $email');
      print('   First Name: $firstName');
      print('   Last Name: $lastName');
      print('   Payload: $payload');
      final response = await _dio.post('/auth/signup', data: payload);
      print('✅ Signup response: ${response.statusCode}');
      final data = response.data as Map<String, dynamic>;
      return AuthSessionModel.fromJson(data);
    } on DioException catch (error) {
      print('❌ Signup error: ${error.message}');
      print('   Status Code: ${error.response?.statusCode}');
      print('   Response Body: ${error.response?.data}');
      print('   Request Data: ${error.requestOptions.data}');
      throw ApiException.fromDioException(error);
    } catch (error) {
      print('❌ Unexpected signup error: $error');
      rethrow;
    }
  }

  Future<void> sendOtp({required String identifier}) async {
    final trimmedIdentifier = identifier.trim();
    try {
      print('📤 Sending OTP to /auth/otp/send');
      print('   Identifier: $trimmedIdentifier');
      await _dio.post(
        '/auth/otp/send',
        data: {'identifier': trimmedIdentifier},
      );
      print('✅ OTP sent successfully');
    } on DioException catch (error) {
      print('❌ OTP send error: ${error.message}');
      print('   Status Code: ${error.response?.statusCode}');
      print('   Response Body: ${error.response?.data}');
      print('   Request Data: ${error.requestOptions.data}');
      throw ApiException.fromDioException(error);
    } catch (error) {
      print('❌ Unexpected OTP send error: $error');
      rethrow;
    }
  }

  Future<AuthSessionModel> _postLogin(Map<String, dynamic> payload) async {
    try {
      print('📤 Sending login request to /auth/login');
      final response = await _dio.post('/auth/login', data: payload);
      print('✅ Login response: ${response.statusCode}');
      final data = response.data as Map<String, dynamic>;
      return AuthSessionModel.fromJson(data);
    } on DioException catch (error) {
      print('❌ Login error: ${error.message} - Status: ${error.response?.statusCode}');
      throw ApiException.fromDioException(error);
    } catch (error) {
      print('❌ Unexpected login error: $error');
      rethrow;
    }
  }
}
