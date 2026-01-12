import 'package:loni_africa/core/network/api_client.dart';
import 'package:loni_africa/core/network/api_exception.dart';
import 'package:loni_africa/core/utilities/jwt_utils.dart';
import 'package:loni_africa/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:loni_africa/features/auth/data/models/auth_session_model.dart';
import 'package:loni_africa/features/auth/data/services/auth_service.dart';
import 'package:loni_africa/features/auth/data/services/auth_token_refresh_service.dart';
import 'package:loni_africa/features/auth/domain/entities/auth_session.dart';
import 'package:loni_africa/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    AuthService? remoteService,
    AuthLocalDataSource? localDataSource,
    AuthTokenRefreshService? tokenRefreshService,
  }) : _remoteService = remoteService ?? AuthService(),
       _localDataSource = localDataSource ?? AuthLocalDataSource(),
       _tokenRefreshService = tokenRefreshService ?? AuthTokenRefreshService() {
    ApiClient.instance.setAuthHandlers(
      tokenRefreshHandler: _refreshAccessToken,
      onAuthFailure: clearSession,
    );
  }

  final AuthService _remoteService;
  final AuthLocalDataSource _localDataSource;
  final AuthTokenRefreshService _tokenRefreshService;

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
        final refreshed = await _tryRefreshSession(session);
        if (refreshed == null) {
          await clearSession();
          return null;
        }
        ApiClient.instance.setAccessToken(refreshed.tokens.accessToken);
      } else {
        ApiClient.instance.setAccessToken(session.tokens.accessToken);
      }

      try {
        await _remoteService.validateSession();
      } on ApiException catch (error) {
        if (error.isUnauthorized && error.isInvalidOrExpiredToken) {
          final refreshed = await _tryRefreshSession(session);
          if (refreshed == null) {
            await clearSession();
            return null;
          }
          ApiClient.instance.setAccessToken(refreshed.tokens.accessToken);
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

  Future<AuthSessionModel?> _tryRefreshSession(AuthSession session) async {
    final refreshToken = session.tokens.refreshToken;
    if (refreshToken.isEmpty) {
      return null;
    }

    try {
      final refreshed = await _tokenRefreshService.refreshSession(
        refreshToken: refreshToken,
        existingUser: session.user,
      );
      await _localDataSource.saveSession(refreshed);
      return refreshed;
    } on ApiException {
      return null;
    } catch (_) {
      return null;
    }
  }

  Future<String?> _refreshAccessToken() async {
    final session = await _localDataSource.getSession();
    if (session == null) {
      return null;
    }

    final refreshed = await _tryRefreshSession(session);
    if (refreshed == null) {
      return null;
    }

    ApiClient.instance.setAccessToken(refreshed.tokens.accessToken);
    return refreshed.tokens.accessToken;
  }
}
