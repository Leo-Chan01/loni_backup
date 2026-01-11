import 'package:flutter/foundation.dart';
import 'package:loni_africa/core/network/api_exception.dart';
import 'package:loni_africa/features/profile/domain/models/user_profile_model.dart';
import 'package:loni_africa/features/profile/domain/usecases/get_profile_usecase.dart';
import 'package:loni_africa/features/profile/domain/usecases/update_profile_usecase.dart';

class ProfileActionResult {
  const ProfileActionResult.success({this.message}) : isSuccess = true;
  const ProfileActionResult.failure({this.message}) : isSuccess = false;

  final bool isSuccess;
  final String? message;
}

class ProfileProvider extends ChangeNotifier {
  ProfileProvider({
    required GetProfileUseCase getProfile,
    required UpdateProfileUseCase updateProfile,
  }) : _getProfile = getProfile,
       _updateProfile = updateProfile;

  final GetProfileUseCase _getProfile;
  final UpdateProfileUseCase _updateProfile;

  UserProfile? _profile;
  bool _isLoading = false;
  bool _isSaving = false;
  String? _errorMessage;

  UserProfile? get profile => _profile;
  bool get isLoading => _isLoading;
  bool get isSaving => _isSaving;
  String? get errorMessage => _errorMessage;

  Future<void> fetchProfile({bool force = false}) async {
    if (!force && _profile != null) {
      return;
    }

    _setLoading(true);
    try {
      _profile = await _getProfile();
      _errorMessage = null;
    } on ApiException catch (error) {
      _errorMessage = _preferredErrorMessage(error);
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _setLoading(false);
    }
  }

  Future<ProfileActionResult> saveProfile({
    required String fullName,
    required String region,
    required String locale,
  }) async {
    _setSaving(true);
    try {
      final parts = fullName.trim().split(RegExp(r'\s+'));
      final firstName = parts.isNotEmpty ? parts.first : '';
      final lastName = parts.length > 1 ? parts.sublist(1).join(' ') : '';

      await _updateProfile(
        firstName: firstName,
        lastName: lastName,
        region: region.trim(),
        locale: locale.trim(),
      );

      await fetchProfile(force: true);

      return const ProfileActionResult.success();
    } on ApiException catch (error) {
      final resolvedMessage = _preferredErrorMessage(error);
      _errorMessage = resolvedMessage;
      return ProfileActionResult.failure(message: resolvedMessage);
    } catch (error) {
      _errorMessage = error.toString();
      return ProfileActionResult.failure(message: error.toString());
    } finally {
      _setSaving(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setSaving(bool value) {
    _isSaving = value;
    notifyListeners();
  }

  String _preferredErrorMessage(ApiException error) {
    final detailsMessage = error.details?['message'];
    if (detailsMessage != null && detailsMessage.toString().isNotEmpty) {
      return detailsMessage.toString();
    }
    return error.message;
  }
}
