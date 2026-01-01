import 'package:dio/dio.dart';
import 'package:loni_africa/core/network/api_client.dart';

class AuthApiService {
  final Dio _dio = ApiClient.instance.dio;

  Future<Map<String, dynamic>> login({
    required String identifier,
    required String password,
    required String deviceId,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {
          'identifier': identifier,
          'password': password,
          'deviceId': deviceId,
        },
      );
      return response.data as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> signup({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String deviceId,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/signup',
        data: {
          'email': email,
          'password': password,
          'firstName': firstName,
          'lastName': lastName,
          'device': {
            'deviceId': deviceId,
            'platform': 'android',
          },
        },
      );
      return response.data as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> sendOtp({
    required String identifier,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/otp/send',
        data: {'identifier': identifier},
      );
      return response.data as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getProfile() async {
    try {
      final response = await _dio.get('/auth/profile');
      return response.data as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateProfile({
    String? firstName,
    String? lastName,
    String? locale,
    String? region,
  }) async {
    try {
      await _dio.patch(
        '/auth/profile',
        data: {
          if (firstName != null) 'firstName': firstName,
          if (lastName != null) 'lastName': lastName,
          if (locale != null) 'locale': locale,
          if (region != null) 'region': region,
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
