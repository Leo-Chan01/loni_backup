enum PaymentStatus {
  pending,
  processing,
  completed,
  failed,
  cancelled,
  refunded,
}

extension PaymentStatusExtension on PaymentStatus {
  String get displayName {
    switch (this) {
      case PaymentStatus.pending:
        return 'Pending';
      case PaymentStatus.processing:
        return 'Processing';
      case PaymentStatus.completed:
        return 'Completed';
      case PaymentStatus.failed:
        return 'Failed';
      case PaymentStatus.cancelled:
        return 'Cancelled';
      case PaymentStatus.refunded:
        return 'Refunded';
    }
  }
}

class Payment {
  final String id;
  final String transactionId;
  final double amount;
  final double processingFee;
  final PaymentStatus status;
  final DateTime createdAt;
  final DateTime? completedAt;
  final String paymentMethod;
  final String? phoneNumber;

  const Payment({
    required this.id,
    required this.transactionId,
    required this.amount,
    required this.processingFee,
    required this.status,
    required this.createdAt,
    this.completedAt,
    required this.paymentMethod,
    this.phoneNumber,
  });

  double get totalAmount => amount + processingFee;

  Payment copyWith({
    String? id,
    String? transactionId,
    double? amount,
    double? processingFee,
    PaymentStatus? status,
    DateTime? createdAt,
    DateTime? completedAt,
    String? paymentMethod,
    String? phoneNumber,
  }) {
    return Payment(
      id: id ?? this.id,
      transactionId: transactionId ?? this.transactionId,
      amount: amount ?? this.amount,
      processingFee: processingFee ?? this.processingFee,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
