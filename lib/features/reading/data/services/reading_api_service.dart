import 'package:dio/dio.dart';
import 'package:loni_africa/core/network/api_client.dart';
import 'package:loni_africa/core/network/api_exception.dart';
import 'package:loni_africa/core/utilities/device_info_service.dart';

import 'drm_api_service.dart';

class ReadingApiService {
  ReadingApiService({
    Dio? dio,
    DrmApiService? drmApiService,
    DeviceInfoService? deviceInfoService,
  }) : _dio = dio ?? ApiClient.instance.dio,
       _drmApiService = drmApiService ?? DrmApiService(dio: dio),
       _deviceInfoService = deviceInfoService ?? DeviceInfoService();

  final Dio _dio;
  final DrmApiService _drmApiService;
  final DeviceInfoService _deviceInfoService;

  final Map<String, String> _licenseIdCache = <String, String>{};

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
    String? previewToken,
  }) async {
    try {
      final response = await _dio.get(
        '/content/$fileId/sample',
        queryParameters: {
          if (licenseId != null) 'licenseId': licenseId,
          if (previewToken != null) 'previewToken': previewToken,
        },
      );
      return response.data as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getSampleForBook({
    required String bookId,
    required String fileId,
    bool withPreviewToken = false,
  }) async {
    final licenseId = await _getOrFetchLicenseId(bookId);
    final previewToken = withPreviewToken
        ? await getPreviewToken(fileId: fileId)
        : null;
    return getSample(
      fileId: fileId,
      licenseId: licenseId,
      previewToken: previewToken,
    );
  }

  Future<Map<String, dynamic>> getContentChunkForBook({
    required String bookId,
    required String fileId,
    required String chunkId,
  }) async {
    final licenseId = await _getOrFetchLicenseId(bookId);
    return getContentChunk(
      fileId: fileId,
      chunkId: chunkId,
      licenseId: licenseId,
    );
  }

  Future<String> getPreviewToken({required String fileId}) async {
    try {
      final response = await _dio.post('/content/$fileId/preview-token');
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

  Future<List<Map<String, dynamic>>> getReadingStates({
    String? catalogItemId,
    String? licenseId,
    String? deviceId,
  }) async {
    try {
      final response = await _dio.get(
        '/analytics/reading-states',
        queryParameters: {
          if (catalogItemId != null) 'catalogItemId': catalogItemId,
          if (licenseId != null) 'licenseId': licenseId,
          if (deviceId != null) 'deviceId': deviceId,
        },
      );
      final data = response.data as List<dynamic>;
      return data.cast<Map<String, dynamic>>();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> syncReadingState({
    required String catalogItemId,
    String? licenseId,
    required String cfi,
    required double percentComplete,
    bool finished = false,
    DateTime? capturedAt,
    String? deviceId,
    Map<String, dynamic>? deviceContext,
    bool offline = false,
  }) async {
    final resolvedLicenseId = (licenseId != null && licenseId.isNotEmpty)
        ? licenseId
        : await _getOrFetchLicenseId(catalogItemId);

    final device = await _deviceInfoService.getDeviceInfo();
    final resolvedDeviceId = (deviceId != null && deviceId.isNotEmpty)
        ? deviceId
        : device.deviceId;
    final resolvedDeviceContext = deviceContext ?? device.toJson();

    try {
      await _dio.post(
        '/analytics/reading-states',
        data: {
          'catalogItemId': catalogItemId,
          'licenseId': resolvedLicenseId,
          'lastLocation': {'cfi': cfi},
          'percentComplete': percentComplete,
          'finished': finished,
          'capturedAt': (capturedAt ?? DateTime.now().toUtc())
              .toIso8601String(),
          'deviceId': resolvedDeviceId,
          'deviceContext': resolvedDeviceContext,
          'offline': offline,
        },
      );
    } on DioException catch (error) {
      throw ApiException.fromDioException(error);
    }
  }

  Future<String> _getOrFetchLicenseId(String bookId) async {
    final cached = _licenseIdCache[bookId];
    if (cached != null && cached.isNotEmpty) {
      return cached;
    }

    final license = await _drmApiService.getLicense(bookId);
    if (license.licenseId.isEmpty) {
      throw ApiException(message: 'Missing DRM licenseId.');
    }

    _licenseIdCache[bookId] = license.licenseId;
    return license.licenseId;
  }
}
