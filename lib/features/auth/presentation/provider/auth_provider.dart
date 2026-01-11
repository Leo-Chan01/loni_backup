import 'package:flutter/foundation.dart';
import 'package:loni_africa/core/network/api_exception.dart';
import 'package:loni_africa/features/auth/domain/entities/auth_session.dart';
import 'package:loni_africa/features/auth/domain/repository/auth_repository.dart';

class AuthActionResult {
  const AuthActionResult.success({this.message}) : isSuccess = true;
  const AuthActionResult.failure({this.message}) : isSuccess = false;

  final bool isSuccess;
  final String? message;
}

class AuthProvider extends ChangeNotifier {
  AuthProvider({required AuthRepository authRepository})
    : _authRepository = authRepository;

  final AuthRepository _authRepository;

  AuthSession? _session;
  bool _isInitializing = false;
  bool _isSigningIn = false;
  bool _isSigningUp = false;
  String? _errorMessage;

  AuthSession? get session => _session;
  bool get isInitializing => _isInitializing;
  bool get isSigningIn => _isSigningIn;
  bool get isSigningUp => _isSigningUp;
  String? get errorMessage => _errorMessage;

  Future<void> loadSession() async {
    _setInitializing(true);
    try {
      _session = await _authRepository.loadSession();
      _errorMessage = null;
    } on ApiException catch (error) {
      _errorMessage = error.message;
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _setInitializing(false);
    }
  }

  Future<AuthActionResult> signInWithPassword({
    required String identifier,
    required String password,
  }) async {
    _setSigningIn(true);
    try {
      final session = await _authRepository.signInWithPassword(
        identifier: identifier,
        password: password,
      );
      _session = session;
      _errorMessage = null;
      return const AuthActionResult.success();
    } on ApiException catch (error) {
      final resolvedMessage = _preferredErrorMessage(error);
      _errorMessage = resolvedMessage;
      return AuthActionResult.failure(message: resolvedMessage);
    } catch (error) {
      _errorMessage = error.toString();
      return AuthActionResult.failure(message: error.toString());
    } finally {
      _setSigningIn(false);
    }
  }

  Future<AuthActionResult> signUpWithPassword({
    required String email,
    required String password,
    required String fullName,
  }) async {
    _setSigningUp(true);
    try {
      final session = await _authRepository.signUpWithPassword(
        email: email,
        password: password,
        fullName: fullName,
      );
      _session = session;
      _errorMessage = null;
      return const AuthActionResult.success();
    } on ApiException catch (error) {
      final resolvedMessage = _preferredErrorMessage(error);
      _errorMessage = resolvedMessage;
      return AuthActionResult.failure(message: resolvedMessage);
    } catch (error) {
      _errorMessage = error.toString();
      return AuthActionResult.failure(message: error.toString());
    } finally {
      _setSigningUp(false);
    }
  }

  Future<void> signOut() async {
    await _authRepository.clearSession();
    _session = null;
    notifyListeners();
  }

  void _setSigningIn(bool value) {
    _isSigningIn = value;
    notifyListeners();
  }

  void _setSigningUp(bool value) {
    _isSigningUp = value;
    notifyListeners();
  }

  void _setInitializing(bool value) {
    _isInitializing = value;
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
