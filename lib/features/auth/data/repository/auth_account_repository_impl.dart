import '../../../../core/utilities/json_map.dart';
import '../../domain/repository/auth_account_repository.dart';
import '../services/auth_account_service.dart';

class AuthAccountRepositoryImpl implements AuthAccountRepository {
  AuthAccountRepositoryImpl({AuthAccountService? service})
    : _service = service ?? AuthAccountService();

  final AuthAccountService _service;

  @override
  Future<JsonMap> getPreferences() => _service.getPreferences();

  @override
  Future<JsonMap> updatePreferences(JsonMap preferences) =>
      _service.updatePreferences(preferences);

  @override
  Future<JsonMap> getConsents() => _service.getConsents();

  @override
  Future<JsonMap> updateConsents(JsonMap consents) => _service.updateConsents(consents);

  @override
  Future<JsonMap> getParentalControls() => _service.getParentalControls();

  @override
  Future<JsonMap> updateParentalControls(JsonMap parentalControls) =>
      _service.updateParentalControls(parentalControls);

  @override
  Future<List<JsonMap>> listSessions() => _service.listSessions();

  @override
  Future<void> deleteSession(String id) => _service.deleteSession(id);

  @override
  Future<List<JsonMap>> listDevices() => _service.listDevices();

  @override
  Future<JsonMap> registerCurrentDevice() => _service.registerCurrentDevice();

  @override
  Future<void> deleteDevice(String id) => _service.deleteDevice(id);

  @override
  Future<List<JsonMap>> listPurchases() => _service.listPurchases();

  @override
  Future<JsonMap> requestPrivacyExport() => _service.requestPrivacyExport();

  @override
  Future<JsonMap> requestPrivacyDelete() => _service.requestPrivacyDelete();
}
