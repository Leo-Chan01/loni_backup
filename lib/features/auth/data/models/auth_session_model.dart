import 'package:loni_africa/features/auth/data/models/user_model.dart';
import 'package:loni_africa/features/auth/domain/entities/auth_session.dart';

class AuthTokensModel extends AuthTokens {
  const AuthTokensModel({
    required super.accessToken,
    required super.refreshToken,
    required super.expiresIn,
    super.refreshTokenExpiresIn,
  });

  factory AuthTokensModel.fromJson(Map<String, dynamic> json) {
    return AuthTokensModel(
      accessToken: (json['accessToken'] ?? '').toString(),
      refreshToken: (json['refreshToken'] ?? '').toString(),
      expiresIn: (json['expiresIn'] ?? 0) is int
          ? json['expiresIn'] as int
          : int.tryParse(json['expiresIn'].toString()) ?? 0,
      refreshTokenExpiresIn: json['refreshTokenExpiresIn'] as int?,
    );
  }

  factory AuthTokensModel.fromEntity(AuthTokens tokens) {
    return AuthTokensModel(
      accessToken: tokens.accessToken,
      refreshToken: tokens.refreshToken,
      expiresIn: tokens.expiresIn,
      refreshTokenExpiresIn: tokens.refreshTokenExpiresIn,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'expiresIn': expiresIn,
      'refreshTokenExpiresIn': refreshTokenExpiresIn,
    };
  }
}

class AuthSessionModel extends AuthSession {
  const AuthSessionModel({
    required super.tokens,
    required UserModel super.user,
  });

  factory AuthSessionModel.fromJson(Map<String, dynamic> json) {
    final userJson =
        (json['user'] ?? <String, dynamic>{}) as Map<String, dynamic>;
    final tokens = AuthTokensModel.fromJson(json);

    // Some responses return refreshTokenExpiresIn inside user; map it to tokens if needed.
    final refreshExpiry = userJson['refreshTokenExpiresIn'] as int?;
    final mergedTokens = AuthTokensModel(
      accessToken: tokens.accessToken,
      refreshToken: tokens.refreshToken,
      expiresIn: tokens.expiresIn,
      refreshTokenExpiresIn: tokens.refreshTokenExpiresIn ?? refreshExpiry,
    );

    return AuthSessionModel(
      tokens: mergedTokens,
      user: UserModel.fromJson(userJson),
    );
  }

  factory AuthSessionModel.fromEntity(AuthSession session) {
    return AuthSessionModel(
      tokens: AuthTokensModel.fromEntity(session.tokens),
      user: UserModel.fromEntity(session.user),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': tokens.accessToken,
      'refreshToken': tokens.refreshToken,
      'expiresIn': tokens.expiresIn,
      'refreshTokenExpiresIn': tokens.refreshTokenExpiresIn,
      'user': (user as UserModel).toJson(),
    };
  }
}
