import '../../repository/auth_account_repository.dart';
import '../../../../../core/utilities/json_map.dart';

class ListAuthSessionsUseCase {
  ListAuthSessionsUseCase(this._repository);

  final AuthAccountRepository _repository;

  Future<List<JsonMap>> call() => _repository.listSessions();
}
