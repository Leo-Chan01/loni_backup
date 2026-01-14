import '../../repository/auth_account_repository.dart';
import '../../../../../core/utilities/json_map.dart';

class UpdateParentalControlsUseCase {
  UpdateParentalControlsUseCase(this._repository);

  final AuthAccountRepository _repository;

  Future<JsonMap> call(JsonMap parentalControls) =>
      _repository.updateParentalControls(parentalControls);
}
