import 'package:loni_africa/features/commerce/domain/models/delivery_address_model.dart';
import 'package:loni_africa/features/commerce/domain/models/order_status_model.dart';
import 'package:loni_africa/features/commerce/domain/models/payment_model.dart';
import 'package:loni_africa/features/commerce/domain/models/tracking_event_model.dart';

enum OrderType { digital, physical }

extension OrderTypeExtension on OrderType {
  String get displayName {
    switch (this) {
      case OrderType.digital:
        return 'Digital';
      case OrderType.physical:
        return 'Hardcopy';
    }
  }
}

class OrderItem {
  final String bookId;
  final String bookTitle;
  final String bookAuthor;
  final String? bookCoverUrl;
  final OrderType orderType;
  final double price;

  const OrderItem({
    required this.bookId,
    required this.bookTitle,
    required this.bookAuthor,
    this.bookCoverUrl,
    required this.orderType,
    required this.price,
  });

  OrderItem copyWith({
    String? bookId,
    String? bookTitle,
    String? bookAuthor,
    String? bookCoverUrl,
    OrderType? orderType,
    double? price,
  }) {
    return OrderItem(
      bookId: bookId ?? this.bookId,
      bookTitle: bookTitle ?? this.bookTitle,
      bookAuthor: bookAuthor ?? this.bookAuthor,
      bookCoverUrl: bookCoverUrl ?? this.bookCoverUrl,
      orderType: orderType ?? this.orderType,
      price: price ?? this.price,
    );
  }
}

class Order {
  final String id;
  final String orderNumber;
  final OrderItem item;
  final OrderStatus status;
  final Payment payment;
  final DateTime createdAt;
  final DateTime? estimatedDelivery;
  final DeliveryAddress? deliveryAddress;
  final List<TrackingEvent> trackingEvents;

  const Order({
    required this.id,
    required this.orderNumber,
    required this.item,
    required this.status,
    required this.payment,
    required this.createdAt,
    this.estimatedDelivery,
    this.deliveryAddress,
    this.trackingEvents = const [],
  });

  bool get isDigital => item.orderType == OrderType.digital;

  bool get requiresDelivery => item.orderType == OrderType.physical;

  Order copyWith({
    String? id,
    String? orderNumber,
    OrderItem? item,
    OrderStatus? status,
    Payment? payment,
    DateTime? createdAt,
    DateTime? estimatedDelivery,
    DeliveryAddress? deliveryAddress,
    List<TrackingEvent>? trackingEvents,
  }) {
    return Order(
      id: id ?? this.id,
      orderNumber: orderNumber ?? this.orderNumber,
      item: item ?? this.item,
      status: status ?? this.status,
      payment: payment ?? this.payment,
      createdAt: createdAt ?? this.createdAt,
      estimatedDelivery: estimatedDelivery ?? this.estimatedDelivery,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      trackingEvents: trackingEvents ?? this.trackingEvents,
    );
  }
}
