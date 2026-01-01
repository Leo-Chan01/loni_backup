import 'package:dio/dio.dart';
import 'package:loni_africa/core/network/api_client.dart';

class CommerceApiService {
  final Dio _dio = ApiClient.instance.dio;

  Future<Map<String, dynamic>> createOrder({
    required List<Map<String, dynamic>> items,
    required String fulfillmentType,
    required String paymentMethod,
    required String currency,
  }) async {
    try {
      final response = await _dio.post(
        '/v1/orders',
        data: {
          'items': items,
          'fulfillmentType': fulfillmentType,
          'paymentMethod': paymentMethod,
          'currency': currency,
        },
      );
      return response.data as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> initiatePayment({
    required String orderId,
    required String provider,
    required String channel,
    required String countryCode,
    required String msisdn,
    required String email,
    required String name,
  }) async {
    try {
      final response = await _dio.post(
        '/v1/orders/$orderId/pay',
        data: {
          'provider': provider,
          'channel': channel,
          'countryCode': countryCode,
          'msisdn': msisdn,
          'email': email,
          'name': name,
        },
      );
      return response.data as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getOrderDetail(String orderId) async {
    try {
      final response = await _dio.get('/v1/orders/$orderId');
      return response.data as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }
}
