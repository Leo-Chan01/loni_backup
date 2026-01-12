import '../../domain/models/drm_license_model.dart';
import '../../domain/repository/drm_repository.dart';
import '../services/drm_api_service.dart';

class DrmRepositoryImpl implements DrmRepository {
  DrmRepositoryImpl({DrmApiService? apiService})
      : _apiService = apiService ?? DrmApiService();

  final DrmApiService _apiService;

  @override
  Future<DrmLicenseModel> getLicense(String bookId) async {
    final dto = await _apiService.getLicense(bookId);
    return DrmLicenseModel(
      licenseId: dto.licenseId,
      deviceLimit: dto.deviceLimit,
      licenseStatus: dto.licenseStatus,
      expiresAt: dto.expiresAt,
      activatedDevices: dto.activatedDevices,
    );
  }
}
