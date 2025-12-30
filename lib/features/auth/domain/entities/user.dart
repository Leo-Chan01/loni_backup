import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    this.email,
    this.phone,
    this.firstName,
    this.lastName,
    this.roles = const [],
    this.deviceId,
    this.region,
    this.locale,
    this.subscriptionTier,
    this.photoUrl,
    this.segments = const [],
    this.publishReady,
    this.payoutMethod,
    this.payoutMobile,
  });

  final String id;
  final String? email;
  final String? phone;
  final String? firstName;
  final String? lastName;
  final List<String> roles;
  final String? deviceId;
  final String? region;
  final String? locale;
  final String? subscriptionTier;
  final String? photoUrl;
  final List<String> segments;
  final bool? publishReady;
  final String? payoutMethod;
  final String? payoutMobile;

  String get displayName {
    final nameParts = [
      firstName,
      lastName,
    ].whereType<String>().where((part) => part.isNotEmpty).toList();
    if (nameParts.isNotEmpty) {
      return nameParts.join(' ');
    }
    if (email != null && email!.isNotEmpty) {
      return email!;
    }
    if (phone != null && phone!.isNotEmpty) {
      return phone!;
    }
    return '';
  }

  @override
  List<Object?> get props => [
    id,
    email,
    phone,
    firstName,
    lastName,
    roles,
    deviceId,
    region,
    locale,
    subscriptionTier,
    photoUrl,
    segments,
    publishReady,
    payoutMethod,
    payoutMobile,
  ];
}
