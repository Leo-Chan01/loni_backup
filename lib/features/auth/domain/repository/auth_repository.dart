import 'package:loni_africa/features/auth/domain/entities/auth_session.dart';

abstract class AuthRepository {
  Future<AuthSession> signInWithPassword({
    required String identifier,
    required String password,
  });

  Future<AuthSession> signInWithOtp({
    required String identifier,
    required String otpCode,
  });

  Future<void> sendOtp({required String identifier});

  Future<AuthSession?> loadSession();

  Future<void> clearSession();
}
