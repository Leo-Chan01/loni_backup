import 'package:loni_africa/features/profile/domain/models/user_profile_model.dart';

class UserProfileDto {
  const UserProfileDto({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.region,
    required this.photoUrl,
    required this.locale,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String region;
  final String photoUrl;
  final String locale;

  factory UserProfileDto.fromJson(Map<String, dynamic> json) {
    return UserProfileDto(
      id: json['id']?.toString() ?? '',
      firstName: json['firstName']?.toString() ?? '',
      lastName: json['lastName']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      region: json['region']?.toString() ?? '',
      photoUrl: json['photoUrl']?.toString() ?? '',
      locale: json['locale']?.toString() ?? '',
    );
  }

  UserProfile toDomain() {
    final safeEmail = email.trim();
    final handle = safeEmail.contains('@') ? safeEmail.split('@').first : '';

    return UserProfile(
      id: id,
      fullName: [firstName, lastName].where((p) => p.trim().isNotEmpty).join(' '),
      username: handle.isEmpty ? '' : '@$handle',
      bio: null,
      email: safeEmail.isEmpty ? null : safeEmail,
      location: region.isEmpty ? null : region,
      avatarUrl: photoUrl.isEmpty ? null : photoUrl,
      coverUrl: null,
      booksRead: 0,
      followers: 0,
      following: 0,
      readingPreferences: const [],
      joinedDate: DateTime.now(),
    );
  }
}
