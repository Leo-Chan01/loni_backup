import 'package:dio/dio.dart';
import 'package:loni_africa/core/network/api_client.dart';
import 'package:loni_africa/core/network/api_exception.dart';
import 'package:loni_africa/features/profile/data/models/user_profile_dto.dart';

class ProfileRemoteDataSource {
  ProfileRemoteDataSource({Dio? dio}) : _dio = dio ?? ApiClient.instance.dio;

  final Dio _dio;

  Future<UserProfileDto> getProfile() async {
    try {
      final response = await _dio.get('/auth/profile');
      final data = response.data as Map<String, dynamic>;
      return UserProfileDto.fromJson(data);
    } on DioException catch (error) {
      throw ApiException.fromDioException(error);
    }
  }

  Future<void> updateProfile({
    required String firstName,
    required String lastName,
    required String region,
    required String locale,
  }) async {
    try {
      await _dio.patch(
        '/auth/profile',
        data: {
          'firstName': firstName,
          'lastName': lastName,
          'region': region,
          'locale': locale,
        },
      );
    } on DioException catch (error) {
      throw ApiException.fromDioException(error);
    }
  }
}
