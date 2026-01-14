import '../../repository/auth_account_repository.dart';

class RevokeAuthSessionUseCase {
  RevokeAuthSessionUseCase(this._repository);

  final AuthAccountRepository _repository;

  Future<void> call(String id) => _repository.deleteSession(id);
}
