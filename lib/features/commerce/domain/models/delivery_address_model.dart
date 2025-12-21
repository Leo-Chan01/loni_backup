class DeliveryAddress {
  final String recipientName;
  final String addressLine1;
  final String addressLine2;
  final String city;
  final String region;
  final String country;
  final String phoneNumber;
  final String? postalCode;

  const DeliveryAddress({
    required this.recipientName,
    required this.addressLine1,
    required this.addressLine2,
    required this.city,
    required this.region,
    required this.country,
    required this.phoneNumber,
    this.postalCode,
  });

  String get fullAddress {
    final parts = [
      recipientName,
      addressLine1,
      addressLine2,
      city,
      if (postalCode != null) postalCode,
      country,
      phoneNumber,
    ];
    return parts.join('\n');
  }

  DeliveryAddress copyWith({
    String? recipientName,
    String? addressLine1,
    String? addressLine2,
    String? city,
    String? region,
    String? country,
    String? phoneNumber,
    String? postalCode,
  }) {
    return DeliveryAddress(
      recipientName: recipientName ?? this.recipientName,
      addressLine1: addressLine1 ?? this.addressLine1,
      addressLine2: addressLine2 ?? this.addressLine2,
      city: city ?? this.city,
      region: region ?? this.region,
      country: country ?? this.country,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      postalCode: postalCode ?? this.postalCode,
    );
  }
}
