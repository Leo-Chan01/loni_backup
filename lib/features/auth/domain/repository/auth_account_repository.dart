import '../../../../core/utilities/json_map.dart';

abstract class AuthAccountRepository {
  Future<JsonMap> getPreferences();
  Future<JsonMap> updatePreferences(JsonMap preferences);

  Future<JsonMap> getConsents();
  Future<JsonMap> updateConsents(JsonMap consents);

  Future<JsonMap> getParentalControls();
  Future<JsonMap> updateParentalControls(JsonMap parentalControls);

  Future<List<JsonMap>> listSessions();
  Future<void> deleteSession(String id);

  Future<List<JsonMap>> listDevices();
  Future<JsonMap> registerCurrentDevice();
  Future<void> deleteDevice(String id);

  Future<List<JsonMap>> listPurchases();

  Future<JsonMap> requestPrivacyExport();
  Future<JsonMap> requestPrivacyDelete();
}
