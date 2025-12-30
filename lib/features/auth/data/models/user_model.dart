import 'package:loni_africa/features/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    super.email,
    super.phone,
    super.firstName,
    super.lastName,
    super.roles = const [],
    super.deviceId,
    super.region,
    super.locale,
    super.subscriptionTier,
    super.photoUrl,
    super.segments = const [],
    super.publishReady,
    super.payoutMethod,
    super.payoutMobile,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: (json['id'] ?? '').toString(),
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      roles:
          (json['roles'] as List?)?.map((e) => e.toString()).toList() ??
          const [],
      deviceId: json['deviceId'] as String?,
      region: json['region'] as String?,
      locale: json['locale'] as String?,
      subscriptionTier: json['subscriptionTier'] as String?,
      photoUrl: json['photoUrl'] as String?,
      segments:
          (json['segments'] as List?)?.map((e) => e.toString()).toList() ??
          const [],
      publishReady: json['publishReady'] as bool?,
      payoutMethod: json['payoutMethod'] as String?,
      payoutMobile: json['payoutMobile'] as String?,
    );
  }

  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      email: user.email,
      phone: user.phone,
      firstName: user.firstName,
      lastName: user.lastName,
      roles: user.roles,
      deviceId: user.deviceId,
      region: user.region,
      locale: user.locale,
      subscriptionTier: user.subscriptionTier,
      photoUrl: user.photoUrl,
      segments: user.segments,
      publishReady: user.publishReady,
      payoutMethod: user.payoutMethod,
      payoutMobile: user.payoutMobile,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'phone': phone,
      'firstName': firstName,
      'lastName': lastName,
      'roles': roles,
      'deviceId': deviceId,
      'region': region,
      'locale': locale,
      'subscriptionTier': subscriptionTier,
      'photoUrl': photoUrl,
      'segments': segments,
      'publishReady': publishReady,
      'payoutMethod': payoutMethod,
      'payoutMobile': payoutMobile,
    };
  }
}
