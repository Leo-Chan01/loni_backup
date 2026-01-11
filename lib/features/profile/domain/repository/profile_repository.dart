import 'package:loni_africa/features/profile/domain/models/user_profile_model.dart';

abstract class ProfileRepository {
  Future<UserProfile> getProfile();

  Future<void> updateProfile({
    required String firstName,
    required String lastName,
    required String region,
    required String locale,
  });
}
