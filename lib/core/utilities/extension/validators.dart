// ignore_for_file: unnecessary_raw_strings

import 'package:loni_africa/core/utilities/log_file.dart';

extension StringValidators on String? {
  String? validateEmail() {
    if (this == null || this!.trim().isEmpty) {
      return 'Please enter an email address';
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(this!.trim())) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validateEmailOrUserName() {
    if (this == null || this!.trim().isEmpty) {
      return 'Please enter a username';
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (emailRegex.hasMatch(this!.trim())) {
      // Valid email
      return null;
    }
    final usernameRegex = RegExp(r'^.{3,}$');
    if (!usernameRegex.hasMatch(this!.trim())) {
      return 'Please enter a valid username (at least 3 characters)';
    }
    return null;
  }

  String? validatePassword() {
    if (this == null || this!.isEmpty) {
      kLogs('Input is empty');
      return 'Please enter a password';
    }
    if (this!.length < 6) {
      return 'Password must be at least 6 characters';
    }
    // Password is valid if it's 6+ characters
    // No other requirements enforced!
    return null;
  }

  String? validateConfirmPassword(String? passwordToMatch) {
    if (this == null || this!.isEmpty) {
      kLogs('Input is empty');
      return 'Please enter a password';
    }
    if (this!.length < 6) {
      return 'Password must be at least 6 characters';
    }
    if (this != passwordToMatch) {
      return 'Passwords do not match';
    }
    // Password is valid if it's 6+ characters and matches
    // No other requirements enforced!
    return null;
  }

  String? validateName() {
    if (this == null || this!.trim().isEmpty) {
      return 'Please enter a name';
    }
    if (this!.length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  String? validateReferrer() {
    if (this == null || this!.trim().isEmpty) {
      return null;
    }
    if (this!.length < 3) {
      return 'Referrer must be at least 3 characters';
    }
    return null;
  }

  String? validatePin() {
    if (this == null || this!.trim().isEmpty) {
      return 'Please enter a pin';
    }
    if (this!.length < 6) {
      return 'Pin must be at least 6 characters';
    }
    return null;
  }

  String? validatePhoneNumber() {
    if (this == null || this!.trim().isEmpty) {
      return 'Please enter a phone number';
    }
    if (this!.length < 10) {
      return 'Phone number must be at least 10 characters';
    }
    return null;
  }

  String? validateLocation() {
    if (this == null ||
        this!.trim().isEmpty ||
        this?.trim() == '' ||
        this?.trim() == 'Not provided yet') {
      return 'Please enter a location';
    }
    if (this!.length < 3) {
      return 'Location must be at least 3 characters';
    }
    return null;
  }
}
