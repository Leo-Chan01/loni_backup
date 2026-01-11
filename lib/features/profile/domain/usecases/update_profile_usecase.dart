import 'package:loni_africa/features/profile/domain/repository/profile_repository.dart';

class UpdateProfileUseCase {
  const UpdateProfileUseCase(this._repository);

  final ProfileRepository _repository;

  Future<void> call({
    required String firstName,
    required String lastName,
    required String region,
    required String locale,
  }) {
    return _repository.updateProfile(
      firstName: firstName,
      lastName: lastName,
      region: region,
      locale: locale,
    );
  }
}
