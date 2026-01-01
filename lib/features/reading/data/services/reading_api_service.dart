import 'package:dio/dio.dart';
import 'package:loni_africa/core/network/api_client.dart';

class ReadingApiService {
  final Dio _dio = ApiClient.instance.dio;

  Future<Map<String, dynamic>> getContentChunk({
    required String fileId,
    required String chunkId,
    required String licenseId,
  }) async {
    try {
      final response = await _dio.get(
        '/content/$fileId/chunks/$chunkId',
        queryParameters: {'licenseId': licenseId},
      );
      return response.data as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getSample({
    required String fileId,
    String? licenseId,
  }) async {
    try {
      final response = await _dio.get(
        '/content/$fileId/sample',
        queryParameters: {
          if (licenseId != null) 'licenseId': licenseId,
        },
      );
      return response.data as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getPreviewToken({
    required String fileId,
  }) async {
    try {
      final response = await _dio.post(
        '/content/$fileId/preview-token',
      );
      return response.data['token'] as String;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getContentPolicy() async {
    try {
      final response = await _dio.get('/content/policy');
      return response.data as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getOfflinePolicy() async {
    try {
      final response = await _dio.get('/content/offline/policy');
      return response.data as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }
}
