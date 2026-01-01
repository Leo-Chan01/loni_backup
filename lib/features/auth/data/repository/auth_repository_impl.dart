import 'package:loni_africa/core/network/api_client.dart';
import 'package:loni_africa/core/network/api_exception.dart';
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
  Future<AuthSession> signInWithOtp({
    required String identifier,
    required String otpCode,
  }) async {
    try {
      final session = await _remoteService.signInWithOtp(
        identifier: identifier,
        otpCode: otpCode,
      );
      await _persistSession(session);
      return session;
    } on ApiException {
      rethrow;
    }
  }

  @override
  Future<void> sendOtp({required String identifier}) async {
    try {
      await _remoteService.sendOtp(identifier: identifier);
    } on ApiException {
      rethrow;
    }
  }

  @override
  Future<AuthSession?> loadSession() async {
    final session = await _localDataSource.getSession();
    if (session != null) {
      ApiClient.instance.setAccessToken(session.tokens.accessToken);
    }
    return session;
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
