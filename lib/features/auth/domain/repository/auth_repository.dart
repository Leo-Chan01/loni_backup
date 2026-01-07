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

  Future<AuthSession> signInWithOtp({
    required String identifier,
    required String otpCode,
  });

  Future<void> sendOtp({required String identifier});

  Future<AuthSession?> loadSession();

  Future<void> clearSession();

  /// Saves the identifier that is pending OTP verification
  Future<void> savePendingOtpVerification(String identifier);

  /// Gets the identifier that is pending OTP verification
  Future<String?> getPendingOtpVerification();

  /// Clears the pending OTP verification state
  Future<void> clearPendingOtpVerification();
}
