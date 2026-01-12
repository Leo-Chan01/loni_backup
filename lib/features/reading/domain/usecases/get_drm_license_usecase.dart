import '../models/drm_license_model.dart';
import '../repository/drm_repository.dart';

class GetDrmLicenseUseCase {
  const GetDrmLicenseUseCase(this._repository);

  final DrmRepository _repository;

  Future<DrmLicenseModel> call(String bookId) {
    return _repository.getLicense(bookId);
  }
}
