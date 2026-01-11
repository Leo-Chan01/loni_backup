import 'package:dio/dio.dart';

class ApiException implements Exception {
  ApiException({required this.message, this.statusCode, this.details});

  final String message;
  final int? statusCode;
  final Map<String, dynamic>? details;

  String? get errorType => details?['error']?.toString();
  String? get code => details?['code']?.toString();

  bool get isUnauthorized {
    if (statusCode == 401) {
      return true;
    }
    final error = errorType;
    if (error != null && error.toLowerCase().contains('unauthorized')) {
      return true;
    }
    final resolvedCode = code;
    if (resolvedCode != null && resolvedCode.startsWith('AUTH_TOKEN_')) {
      return true;
    }
    return false;
  }

  bool get isInvalidOrExpiredToken {
    final resolvedCode = code;
    if (resolvedCode == 'AUTH_TOKEN_INVALID') {
      return true;
    }
    // Fallback for backends that only return a message.
    return message.toLowerCase().contains('invalid or expired token');
  }

  factory ApiException.fromDioException(DioException error) {
    final status = error.response?.statusCode;
    final responseData = error.response?.data;
    String? resolvedMessage;
    Map<String, dynamic>? resolvedDetails;

    if (responseData is Map<String, dynamic>) {
      resolvedMessage = _extractMessage(responseData);
      resolvedDetails = responseData;
    } else if (responseData is String) {
      resolvedMessage = responseData;
    }

    resolvedMessage ??= error.message ?? 'Unexpected error occurred.';

    return ApiException(
      message: resolvedMessage,
      statusCode: status,
      details: resolvedDetails,
    );
  }

  static String? _extractMessage(Map<String, dynamic> data) {
    final message = data['message'];
    if (message != null) {
      if (message is List && message.isNotEmpty) {
        return message.first.toString();
      }
      return message.toString();
    }
    if (data['error'] != null) {
      return data['error'].toString();
    }
    return null;
  }

  @override
  String toString() {
    final code = statusCode != null ? ' ($statusCode)' : '';
    return 'ApiException$code: $message';
  }
}
