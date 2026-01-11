import 'dart:convert';

class JwtUtils {
  JwtUtils._();

  static bool isExpired(String token, {Duration clockSkew = Duration.zero}) {
    final expiry = expiryDateTime(token);
    if (expiry == null) {
      return false;
    }

    final now = DateTime.now().toUtc().add(clockSkew);
    return !expiry.isAfter(now);
  }

  /// Returns the token expiry in UTC if the token is a JWT with an `exp` claim.
  /// Otherwise returns null.
  static DateTime? expiryDateTime(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      return null;
    }

    final payload = _decodeBase64UrlToJson(parts[1]);
    if (payload == null) {
      return null;
    }

    final exp = payload['exp'];
    if (exp is int) {
      return DateTime.fromMillisecondsSinceEpoch(exp * 1000, isUtc: true);
    }
    if (exp is String) {
      final parsed = int.tryParse(exp);
      if (parsed != null) {
        return DateTime.fromMillisecondsSinceEpoch(parsed * 1000, isUtc: true);
      }
    }

    return null;
  }

  static Map<String, dynamic>? _decodeBase64UrlToJson(String input) {
    try {
      final normalized = base64Url.normalize(input);
      final decoded = utf8.decode(base64Url.decode(normalized));
      final jsonValue = jsonDecode(decoded);
      if (jsonValue is Map<String, dynamic>) {
        return jsonValue;
      }
      if (jsonValue is Map) {
        return jsonValue.map((key, value) => MapEntry(key.toString(), value));
      }
      return null;
    } catch (_) {
      return null;
    }
  }
}
