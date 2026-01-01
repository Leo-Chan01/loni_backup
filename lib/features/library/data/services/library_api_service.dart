import 'package:dio/dio.dart';
import 'package:loni_africa/core/network/api_client.dart';
import 'package:loni_africa/features/library/domain/models/order.dart';

class LibraryApiService {
  final Dio _dio = ApiClient.instance.dio;

  Future<List<Order>> getOrders({
    String? status,
    String? fulfillmentType,
    int limit = 100,
  }) async {
    try {
      final response = await _dio.get(
        '/v1/orders',
        queryParameters: {
          if (status != null) 'status': status,
          if (fulfillmentType != null) 'fulfillmentType': fulfillmentType,
          'limit': limit,
        },
      );

      final items = response.data['items'] as List<dynamic>?;
      if (items == null) return [];

      return items
          .map((item) => _mapToOrder(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<Order> getOrderDetail(String orderId) async {
    try {
      final response = await _dio.get('/v1/orders/$orderId');
      return _mapToOrder(response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Order _mapToOrder(Map<String, dynamic> json) {
    return Order(
      orderId: json['orderId'] as String? ?? '',
      status: json['status'] as String? ?? 'PENDING',
      fulfillmentType: json['fulfillmentType'] as String? ?? 'DIGITAL',
      totalCents: json['totalCents'] as int? ?? 0,
      currency: json['currency'] as String? ?? 'XOF',
      createdAt:
          DateTime.parse(json['createdAt'] as String? ?? DateTime.now().toIso8601String()),
      items: (json['items'] as List<dynamic>? ?? [])
          .map((i) => OrderItem(
                id: i['id'] as String? ?? '',
                catalogItemId: i['catalogItemId'] as String? ?? '',
                title: i['title'] as String? ?? 'Unknown',
                quantity: i['quantity'] as int? ?? 1,
                unitPriceCents: i['unitPriceCents'] as int? ?? 0,
                fulfillmentType: i['fulfillmentType'] as String? ?? 'DIGITAL',
              ))
          .toList(),
    );
  }
}
