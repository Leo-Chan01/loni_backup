import 'package:loni_africa/core/network/api_client.dart';
import 'package:loni_africa/core/network/api_exception.dart';
import 'package:loni_africa/core/utilities/jwt_utils.dart';
import 'package:loni_africa/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:loni_africa/features/auth/data/models/auth_session_model.dart';
import 'package:loni_africa/features/auth/data/services/auth_service.dart';
import 'package:loni_africa/features/auth/domain/entities/auth_session.dart';
import 'package:loni_africa/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    AuthService? remoteService,
    AuthLocalDataSource? localDataSource,
  }) : _remoteService = remoteService ?? AuthService(),
       _localDataSource = localDataSource ?? AuthLocalDataSource();

  final AuthService _remoteService;
  final AuthLocalDataSource _localDataSource;

  @override
  Future<AuthSession> signInWithPassword({
    required String identifier,
    required String password,
  }) async {
    try {
      final session = await _remoteService.signInWithPassword(
        identifier: identifier,
        password: password,
      );
      await _persistSession(session);
      return session;
    } on ApiException {
      rethrow;
    }
  }

  @override
  Future<AuthSession> signUpWithPassword({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      final session = await _remoteService.signUpWithPassword(
        email: email,
        password: password,
        fullName: fullName,
      );
      await _persistSession(session);
      return session;
    } on ApiException {
      rethrow;
    }
  }

  @override
  Future<AuthSession?> loadSession() async {
    final session = await _localDataSource.getSession();
    if (session != null) {
      if (JwtUtils.isExpired(session.tokens.accessToken)) {
        await clearSession();
        return null;
      }
      ApiClient.instance.setAccessToken(session.tokens.accessToken);

      try {
        await _remoteService.validateSession();
      } on ApiException catch (error) {
        if (error.isUnauthorized && error.isInvalidOrExpiredToken) {
          await clearSession();
          return null;
        }
        rethrow;
      }
    }
    return session;
  }

  @override
  Future<void> requestPasswordReset({required String identifier}) async {
    await _remoteService.requestPasswordReset(identifier: identifier);
  }

  @override
  Future<void> confirmPasswordReset({
    required String token,
    required String password,
  }) async {
    await _remoteService.confirmPasswordReset(token: token, password: password);
  }

  @override
  Future<void> clearSession() async {
    await _localDataSource.clearSession();
    ApiClient.instance.setAccessToken(null);
  }

  Future<void> _persistSession(AuthSession session) async {
    if (session is AuthSessionModel) {
      await _localDataSource.saveSession(session);
    } else {
      final model = AuthSessionModel.fromEntity(session);
      await _localDataSource.saveSession(model);
    }
    ApiClient.instance.setAccessToken(session.tokens.accessToken);
  }
}
