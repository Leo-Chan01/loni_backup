import 'package:loni_africa/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:loni_africa/features/profile/domain/models/user_profile_model.dart';
import 'package:loni_africa/features/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl({ProfileRemoteDataSource? remoteDataSource})
    : _remote = remoteDataSource ?? ProfileRemoteDataSource();

  final ProfileRemoteDataSource _remote;

  @override
  Future<UserProfile> getProfile() async {
    final dto = await _remote.getProfile();
    return dto.toDomain();
  }

  @override
  Future<void> updateProfile({
    required String firstName,
    required String lastName,
    required String region,
    required String locale,
  }) {
    return _remote.updateProfile(
      firstName: firstName,
      lastName: lastName,
      region: region,
      locale: locale,
    );
  }
}
