/// Validation utility class for form inputs
class Validators {
  Validators._();

  /// Validates email format
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  /// Validates phone number format
  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }

    final phoneRegex = RegExp(r'^\+?[1-9]\d{1,14}$');
    final cleanedPhone = value.trim().replaceAll(RegExp(r'[\s-]'), '');

    if (!phoneRegex.hasMatch(cleanedPhone)) {
      return 'Please enter a valid phone number';
    }

    return null;
  }

  /// Validates email or phone number
  static String? validateEmailOrPhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email or phone number is required';
    }

    final trimmedValue = value.trim();
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    final phoneRegex = RegExp(r'^\+?[1-9]\d{1,14}$');
    final cleanedPhone = trimmedValue.replaceAll(RegExp(r'[\s-]'), '');

    if (!emailRegex.hasMatch(trimmedValue) &&
        !phoneRegex.hasMatch(cleanedPhone)) {
      return 'Please enter a valid email or phone number';
    }

    return null;
  }

  /// Validates password
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    return null;
  }

  /// Validates required field
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  /// Validates OTP code
  static String? validateOtp(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Verification code is required';
    }

    if (value.trim().length != 6) {
      return 'Verification code must be 6 digits';
    }

    if (!RegExp(r'^\d{6}$').hasMatch(value.trim())) {
      return 'Verification code must contain only numbers';
    }

    return null;
  }
}
