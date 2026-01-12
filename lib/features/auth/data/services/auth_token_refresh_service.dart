import 'package:dio/dio.dart';
import 'package:loni_africa/core/network/api_client.dart';
import 'package:loni_africa/core/network/api_exception.dart';
import 'package:loni_africa/features/auth/data/models/auth_session_model.dart';
import 'package:loni_africa/features/auth/domain/entities/user.dart';

class AuthTokenRefreshService {
  AuthTokenRefreshService({Dio? dio}) : _dio = dio ?? ApiClient.instance.dio;

  final Dio _dio;

  Future<AuthSessionModel> refreshSession({
    required String refreshToken,
    required User existingUser,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/token/refresh',
        data: {'refreshToken': refreshToken},
        options: Options(extra: {'__skipAuthRefresh': true}),
      );

      if (response.data is! Map<String, dynamic>) {
        throw ApiException(message: 'Unexpected response from server.');
      }

      final data = response.data as Map<String, dynamic>;

      // Many backends return a full session (tokens + user). If user is missing,
      // keep the existing user from local session.
      final hasUser = data['user'] is Map;
      if (!hasUser) {
        final patched = <String, dynamic>{
          ...data,
          'user': _userToJson(existingUser),
        };
        return AuthSessionModel.fromJson(patched);
      }

      return AuthSessionModel.fromJson(data);
    } on DioException catch (error) {
      throw ApiException.fromDioException(error);
    }
  }

  Map<String, dynamic> _userToJson(User user) {
    return {
      'id': user.id,
      'email': user.email,
      'phone': user.phone,
      'firstName': user.firstName,
      'lastName': user.lastName,
      'roles': user.roles,
      'deviceId': user.deviceId,
      'region': user.region,
      'locale': user.locale,
      'subscriptionTier': user.subscriptionTier,
      'photoUrl': user.photoUrl,
      'segments': user.segments,
      'publishReady': user.publishReady,
      'payoutMethod': user.payoutMethod,
      'payoutMobile': user.payoutMobile,
    };
  }
}
