import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:loni_africa/features/auth/data/models/auth_session_model.dart';
import 'package:loni_africa/features/auth/domain/entities/auth_session.dart';

class AuthLocalDataSource {
  static const _sessionKey = 'auth_session';

  Future<void> saveSession(AuthSession session) async {
    final prefs = await SharedPreferences.getInstance();
    final model = AuthSessionModel.fromEntity(session);
    await prefs.setString(_sessionKey, jsonEncode(model.toJson()));
  }

  Future<AuthSession?> getSession() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_sessionKey);
    if (raw == null || raw.isEmpty) {
      return null;
    }
    final json = jsonDecode(raw) as Map<String, dynamic>;
    return AuthSessionModel.fromJson(json);
  }

  Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_sessionKey);
    await prefs.remove('pending_otp_verification');
  }
}
