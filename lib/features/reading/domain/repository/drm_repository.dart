import '../models/drm_license_model.dart';

abstract class DrmRepository {
  Future<DrmLicenseModel> getLicense(String bookId);
}
