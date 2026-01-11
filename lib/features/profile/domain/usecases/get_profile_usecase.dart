import 'package:loni_africa/features/profile/domain/models/user_profile_model.dart';
import 'package:loni_africa/features/profile/domain/repository/profile_repository.dart';

class GetProfileUseCase {
  const GetProfileUseCase(this._repository);

  final ProfileRepository _repository;

  Future<UserProfile> call() => _repository.getProfile();
}
