import '../../repository/auth_account_repository.dart';
import '../../../../../core/utilities/json_map.dart';

class ListAuthDevicesUseCase {
  ListAuthDevicesUseCase(this._repository);

  final AuthAccountRepository _repository;

  Future<List<JsonMap>> call() => _repository.listDevices();
}
