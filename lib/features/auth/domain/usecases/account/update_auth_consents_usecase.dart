import '../../repository/auth_account_repository.dart';
import '../../../../../core/utilities/json_map.dart';

class UpdateAuthConsentsUseCase {
  UpdateAuthConsentsUseCase(this._repository);

  final AuthAccountRepository _repository;

  Future<JsonMap> call(JsonMap consents) => _repository.updateConsents(consents);
}
