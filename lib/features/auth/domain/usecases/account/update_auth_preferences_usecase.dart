import '../../repository/auth_account_repository.dart';
import '../../../../../core/utilities/json_map.dart';

class UpdateAuthPreferencesUseCase {
  UpdateAuthPreferencesUseCase(this._repository);

  final AuthAccountRepository _repository;

  Future<JsonMap> call(JsonMap preferences) =>
      _repository.updatePreferences(preferences);
}
