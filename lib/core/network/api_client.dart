import 'dart:async';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:loni_africa/core/network/api_config.dart';

class ApiClient {
  ApiClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: ApiConfig.requestTimeout,
        receiveTimeout: ApiConfig.requestTimeout,
        headers: {'Content-Type': 'application/json'},
      ),
    );

    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (object) => _logger.d(object),
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          if (!_shouldAttemptTokenRefresh(error)) {
            return handler.next(error);
          }

          try {
            final accessToken = await _refreshAccessToken();
            if (accessToken == null || accessToken.isEmpty) {
              await _invalidateSession();
              return handler.next(error);
            }

            final retryResponse = await _retryWithNewToken(
              error.requestOptions,
              accessToken,
            );
            return handler.resolve(retryResponse);
          } catch (_) {
            await _invalidateSession();
            return handler.next(error);
          }
        },
      ),
    );
  }

  late final Dio _dio;
  final Logger _logger = Logger();

  Future<String?> Function()? _tokenRefreshHandler;
  Future<void> Function()? _onAuthFailure;
  Completer<String?>? _refreshCompleter;

  static final ApiClient instance = ApiClient._internal();

  Dio get dio => _dio;

  void setAccessToken(String? token) {
    if (token == null || token.isEmpty) {
      _dio.options.headers.remove('Authorization');
    } else {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }
  }

  void setAuthHandlers({
    Future<String?> Function()? tokenRefreshHandler,
    Future<void> Function()? onAuthFailure,
  }) {
    _tokenRefreshHandler = tokenRefreshHandler;
    _onAuthFailure = onAuthFailure;
  }

  bool _shouldAttemptTokenRefresh(DioException error) {
    final status = error.response?.statusCode;
    if (status != 401) {
      return false;
    }

    final options = error.requestOptions;
    if (options.extra['__skipAuthRefresh'] == true) {
      return false;
    }
    if (options.extra['__authRetry'] == true) {
      return false;
    }
    if (_tokenRefreshHandler == null) {
      return false;
    }

    return true;
  }

  Future<String?> _refreshAccessToken() async {
    if (_tokenRefreshHandler == null) {
      return null;
    }

    if (_refreshCompleter != null) {
      return _refreshCompleter!.future;
    }

    _refreshCompleter = Completer<String?>();
    try {
      final token = await _tokenRefreshHandler!.call();
      _refreshCompleter!.complete(token);
      return token;
    } catch (error, stackTrace) {
      _refreshCompleter!.completeError(error, stackTrace);
      rethrow;
    } finally {
      _refreshCompleter = null;
    }
  }

  Future<void> _invalidateSession() async {
    if (_onAuthFailure != null) {
      await _onAuthFailure!.call();
    }
  }

  Future<Response<dynamic>> _retryWithNewToken(
    RequestOptions requestOptions,
    String accessToken,
  ) async {
    final options = Options(
      method: requestOptions.method,
      headers: Map<String, dynamic>.from(requestOptions.headers)
        ..['Authorization'] = 'Bearer $accessToken',
      responseType: requestOptions.responseType,
      contentType: requestOptions.contentType,
      followRedirects: requestOptions.followRedirects,
      receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
      validateStatus: requestOptions.validateStatus,
      receiveTimeout: requestOptions.receiveTimeout,
      sendTimeout: requestOptions.sendTimeout,
      extra: Map<String, dynamic>.from(requestOptions.extra)
        ..['__authRetry'] = true,
    );

    return _dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
      cancelToken: requestOptions.cancelToken,
      onReceiveProgress: requestOptions.onReceiveProgress,
      onSendProgress: requestOptions.onSendProgress,
    );
  }
}
