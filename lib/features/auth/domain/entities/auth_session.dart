import 'package:equatable/equatable.dart';
import 'package:loni_africa/features/auth/domain/entities/user.dart';

class AuthTokens extends Equatable {
  const AuthTokens({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
    this.refreshTokenExpiresIn,
  });

  final String accessToken;
  final String refreshToken;
  final int expiresIn;
  final int? refreshTokenExpiresIn;

  @override
  List<Object?> get props => [
    accessToken,
    refreshToken,
    expiresIn,
    refreshTokenExpiresIn,
  ];
}

class AuthSession extends Equatable {
  const AuthSession({required this.tokens, required this.user});

  final AuthTokens tokens;
  final User user;

  @override
  List<Object?> get props => [tokens, user];
}
