import 'package:dio/dio.dart';

import 'package:loni_africa/core/network/api_client.dart';
import 'package:loni_africa/core/network/api_exception.dart';

import '../models/drm_license_dto.dart';

class DrmApiService {
  DrmApiService({Dio? dio}) : _dio = dio ?? ApiClient.instance.dio;

  final Dio _dio;

  Future<DrmLicenseDto> getLicense(String bookId) async {
    try {
      final response = await _dio.get('/drm/licenses/$bookId');

      final data = response.data;
      if (data is! Map) {
        throw ApiException(message: 'Unexpected response from server.');
      }

      return DrmLicenseDto.fromJson(
        data.map((k, v) => MapEntry(k.toString(), v)),
      );
    } on DioException catch (error) {
      throw ApiException.fromDioException(error);
    }
  }
}
