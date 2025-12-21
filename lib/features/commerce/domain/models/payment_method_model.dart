enum PaymentProvider {
  mtn,
  orange,
  airtel,
  mpesa,
  card,
  bankTransfer,
}

extension PaymentProviderExtension on PaymentProvider {
  String get displayName {
    switch (this) {
      case PaymentProvider.mtn:
        return 'MTN Mobile Money';
      case PaymentProvider.orange:
        return 'Orange Money';
      case PaymentProvider.airtel:
        return 'Airtel Money';
      case PaymentProvider.mpesa:
        return 'M-Pesa';
      case PaymentProvider.card:
        return 'Card Payment';
      case PaymentProvider.bankTransfer:
        return 'Bank Transfer';
    }
  }

  String get description {
    switch (this) {
      case PaymentProvider.mtn:
        return 'Fast & secure payment';
      case PaymentProvider.orange:
        return 'Instant transfer';
      case PaymentProvider.airtel:
        return 'Quick checkout';
      case PaymentProvider.mpesa:
        return 'Trusted payment';
      case PaymentProvider.card:
        return 'Visa, Mastercard accepted';
      case PaymentProvider.bankTransfer:
        return 'Direct bank payment';
    }
  }

  String get iconLetter {
    switch (this) {
      case PaymentProvider.mtn:
        return 'M';
      case PaymentProvider.orange:
        return 'O';
      case PaymentProvider.airtel:
        return 'A';
      case PaymentProvider.mpesa:
        return 'M';
      case PaymentProvider.card:
        return 'C';
      case PaymentProvider.bankTransfer:
        return 'B';
    }
  }
}

class PaymentMethod {
  final PaymentProvider provider;
  final String? phoneNumber;
  final String? accountNumber;

  const PaymentMethod({
    required this.provider,
    this.phoneNumber,
    this.accountNumber,
  });

  PaymentMethod copyWith({
    PaymentProvider? provider,
    String? phoneNumber,
    String? accountNumber,
  }) {
    return PaymentMethod(
      provider: provider ?? this.provider,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      accountNumber: accountNumber ?? this.accountNumber,
    );
  }
}
