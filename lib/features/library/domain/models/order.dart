import 'package:equatable/equatable.dart';

class OrderItem extends Equatable {
  const OrderItem({
    required this.id,
    required this.catalogItemId,
    required this.title,
    required this.quantity,
    required this.unitPriceCents,
    required this.fulfillmentType,
  });

  final String id;
  final String catalogItemId;
  final String title;
  final int quantity;
  final int unitPriceCents;
  final String fulfillmentType; // DIGITAL or PRINT

  @override
  List<Object?> get props => [
        id,
        catalogItemId,
        title,
        quantity,
        unitPriceCents,
        fulfillmentType,
      ];
}

class Order extends Equatable {
  const Order({
    required this.orderId,
    required this.status,
    required this.fulfillmentType,
    required this.totalCents,
    required this.currency,
    required this.createdAt,
    required this.items,
  });

  final String orderId;
  final String status;
  final String fulfillmentType;
  final int totalCents;
  final String currency;
  final DateTime createdAt;
  final List<OrderItem> items;

  @override
  List<Object?> get props => [
        orderId,
        status,
        fulfillmentType,
        totalCents,
        currency,
        createdAt,
        items,
      ];
}
