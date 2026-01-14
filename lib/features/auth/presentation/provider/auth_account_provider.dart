import 'package:flutter/foundation.dart';

import '../../../../core/network/api_exception.dart';
import '../../../../core/utilities/json_map.dart';
import '../../domain/usecases/account/delete_auth_device_usecase.dart';
import '../../domain/usecases/account/get_auth_consents_usecase.dart';
import '../../domain/usecases/account/get_auth_preferences_usecase.dart';
import '../../domain/usecases/account/get_parental_controls_usecase.dart';
import '../../domain/usecases/account/list_auth_devices_usecase.dart';
import '../../domain/usecases/account/list_auth_purchases_usecase.dart';
import '../../domain/usecases/account/list_auth_sessions_usecase.dart';
import '../../domain/usecases/account/register_auth_device_usecase.dart';
import '../../domain/usecases/account/request_privacy_delete_usecase.dart';
import '../../domain/usecases/account/request_privacy_export_usecase.dart';
import '../../domain/usecases/account/revoke_auth_session_usecase.dart';
import '../../domain/usecases/account/update_auth_consents_usecase.dart';
import '../../domain/usecases/account/update_auth_preferences_usecase.dart';
import '../../domain/usecases/account/update_parental_controls_usecase.dart';

class AuthAccountProvider extends ChangeNotifier {
  AuthAccountProvider({
    required GetAuthPreferencesUseCase getPreferences,
    required UpdateAuthPreferencesUseCase updatePreferences,
    required GetAuthConsentsUseCase getConsents,
    required UpdateAuthConsentsUseCase updateConsents,
    required GetParentalControlsUseCase getParentalControls,
    required UpdateParentalControlsUseCase updateParentalControls,
    required ListAuthSessionsUseCase listSessions,
    required RevokeAuthSessionUseCase revokeSession,
    required ListAuthDevicesUseCase listDevices,
    required RegisterAuthDeviceUseCase registerDevice,
    required DeleteAuthDeviceUseCase deleteDevice,
    required ListAuthPurchasesUseCase listPurchases,
    required RequestPrivacyExportUseCase requestPrivacyExport,
    required RequestPrivacyDeleteUseCase requestPrivacyDelete,
  }) : _getPreferences = getPreferences,
       _updatePreferences = updatePreferences,
       _getConsents = getConsents,
       _updateConsents = updateConsents,
       _getParentalControls = getParentalControls,
       _updateParentalControls = updateParentalControls,
       _listSessions = listSessions,
       _revokeSession = revokeSession,
       _listDevices = listDevices,
       _registerDevice = registerDevice,
       _deleteDevice = deleteDevice,
       _listPurchases = listPurchases,
       _requestPrivacyExport = requestPrivacyExport,
       _requestPrivacyDelete = requestPrivacyDelete;

  final GetAuthPreferencesUseCase _getPreferences;
  final UpdateAuthPreferencesUseCase _updatePreferences;
  final GetAuthConsentsUseCase _getConsents;
  final UpdateAuthConsentsUseCase _updateConsents;
  final GetParentalControlsUseCase _getParentalControls;
  final UpdateParentalControlsUseCase _updateParentalControls;
  final ListAuthSessionsUseCase _listSessions;
  final RevokeAuthSessionUseCase _revokeSession;
  final ListAuthDevicesUseCase _listDevices;
  final RegisterAuthDeviceUseCase _registerDevice;
  final DeleteAuthDeviceUseCase _deleteDevice;
  final ListAuthPurchasesUseCase _listPurchases;
  final RequestPrivacyExportUseCase _requestPrivacyExport;
  final RequestPrivacyDeleteUseCase _requestPrivacyDelete;

  bool _isLoading = false;
  String? _errorMessage;

  JsonMap? _preferences;
  JsonMap? _consents;
  JsonMap? _parentalControls;

  List<JsonMap> _sessions = const [];
  List<JsonMap> _devices = const [];
  List<JsonMap> _purchases = const [];

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  JsonMap? get preferences => _preferences;
  JsonMap? get consents => _consents;
  JsonMap? get parentalControls => _parentalControls;

  List<JsonMap> get sessions => _sessions;
  List<JsonMap> get devices => _devices;
  List<JsonMap> get purchases => _purchases;

  Future<void> loadPreferences() => _guarded(() async {
    _preferences = await _getPreferences();
  });

  Future<void> savePreferences(JsonMap preferences) => _guarded(() async {
    _preferences = await _updatePreferences(preferences);
  });

  Future<void> loadConsents() => _guarded(() async {
    _consents = await _getConsents();
  });

  Future<void> saveConsents(JsonMap consents) => _guarded(() async {
    _consents = await _updateConsents(consents);
  });

  Future<void> loadParentalControls() => _guarded(() async {
    _parentalControls = await _getParentalControls();
  });

  Future<void> saveParentalControls(JsonMap parentalControls) => _guarded(() async {
    _parentalControls = await _updateParentalControls(parentalControls);
  });

  Future<void> loadSessions() => _guarded(() async {
    _sessions = await _listSessions();
  });

  Future<void> revokeSession(String id) => _guarded(() async {
    await _revokeSession(id);
    _sessions = await _listSessions();
  });

  Future<void> loadDevices() => _guarded(() async {
    _devices = await _listDevices();
  });

  Future<void> registerCurrentDevice() => _guarded(() async {
    await _registerDevice();
    _devices = await _listDevices();
  });

  Future<void> deleteDevice(String id) => _guarded(() async {
    await _deleteDevice(id);
    _devices = await _listDevices();
  });

  Future<void> loadPurchases() => _guarded(() async {
    _purchases = await _listPurchases();
  });

  Future<JsonMap?> requestPrivacyExport() async {
    JsonMap? result;
    await _guarded(() async {
      result = await _requestPrivacyExport();
    });
    return result;
  }

  Future<JsonMap?> requestPrivacyDelete() async {
    JsonMap? result;
    await _guarded(() async {
      result = await _requestPrivacyDelete();
    });
    return result;
  }

  Future<void> _guarded(Future<void> Function() action) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await action();
    } on ApiException catch (error) {
      _errorMessage = error.message;
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
