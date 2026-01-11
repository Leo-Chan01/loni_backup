import 'package:loni_africa/features/auth/domain/entities/auth_session.dart';

abstract class AuthRepository {
  Future<AuthSession> signInWithPassword({
    required String identifier,
    required String password,
  });

  Future<AuthSession> signUpWithPassword({
    required String email,
    required String password,
    required String fullName,
  });

  Future<AuthSession?> loadSession();

  Future<void> clearSession();
}
