enum OrderStatus {
  pending,
  confirmed,
  processing,
  shipped,
  inTransit,
  outForDelivery,
  delivered,
  cancelled,
  refunded,
}

extension OrderStatusExtension on OrderStatus {
  String get displayName {
    switch (this) {
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.confirmed:
        return 'Confirmed';
      case OrderStatus.processing:
        return 'Processing';
      case OrderStatus.shipped:
        return 'Shipped';
      case OrderStatus.inTransit:
        return 'In Transit';
      case OrderStatus.outForDelivery:
        return 'Out for Delivery';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.cancelled:
        return 'Cancelled';
      case OrderStatus.refunded:
        return 'Refunded';
    }
  }

  bool get isActive {
    return this != OrderStatus.delivered &&
        this != OrderStatus.cancelled &&
        this != OrderStatus.refunded;
  }

  bool get isCompleted {
    return this == OrderStatus.delivered;
  }
}
