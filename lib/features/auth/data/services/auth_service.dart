import 'package:loni_africa/core/utilities/validators.dart';

/// Authentication service to handle all auth-related business logic
class AuthService {
  /// Sign in with email/phone and password
  Future<AuthResult> signIn({
    required String emailOrPhone,
    required String password,
  }) async {
    // Validate inputs
    final emailOrPhoneError = Validators.validateEmailOrPhone(emailOrPhone);
    if (emailOrPhoneError != null) {
      return AuthResult.failure(emailOrPhoneError);
    }

    final passwordError = Validators.validatePassword(password);
    if (passwordError != null) {
      return AuthResult.failure(passwordError);
    }

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // TODO: Implement actual API call
      // final response = await _apiClient.post('/auth/login', {
      //   'emailOrPhone': emailOrPhone.trim(),
      //   'password': password,
      // });

      return AuthResult.success(
        message: 'Login successful! Please verify your account.',
        data: {'emailOrPhone': emailOrPhone.trim()},
      );
    } catch (e) {
      return AuthResult.failure('Login failed. Please check your credentials.');
    }
  }

  /// Verify OTP code
  Future<AuthResult> verifyOtp({
    required String otp,
    required String emailOrPhone,
  }) async {
    // Validate OTP
    final otpError = Validators.validateOtp(otp);
    if (otpError != null) {
      return AuthResult.failure(otpError);
    }

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // TODO: Implement actual API call
      // final response = await _apiClient.post('/auth/verify-otp', {
      //   'otp': otp,
      //   'emailOrPhone': emailOrPhone,
      // });

      return AuthResult.success(message: 'Verification successful!');
    } catch (e) {
      return AuthResult.failure('Verification failed. Please try again.');
    }
  }

  /// Resend OTP code
  Future<AuthResult> resendOtp({required String emailOrPhone}) async {
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      // TODO: Implement actual API call
      // final response = await _apiClient.post('/auth/resend-otp', {
      //   'emailOrPhone': emailOrPhone,
      // });

      return AuthResult.success(
        message: 'Verification code sent to $emailOrPhone',
      );
    } catch (e) {
      return AuthResult.failure('Failed to resend code. Please try again.');
    }
  }
}

/// Authentication result wrapper
class AuthResult {
  final bool isSuccess;
  final String message;
  final Map<String, dynamic>? data;

  AuthResult._({required this.isSuccess, required this.message, this.data});

  factory AuthResult.success({
    required String message,
    Map<String, dynamic>? data,
  }) {
    return AuthResult._(isSuccess: true, message: message, data: data);
  }

  factory AuthResult.failure(String message) {
    return AuthResult._(isSuccess: false, message: message);
  }
}
