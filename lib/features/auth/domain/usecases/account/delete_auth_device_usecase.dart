import '../../repository/auth_account_repository.dart';

class DeleteAuthDeviceUseCase {
  DeleteAuthDeviceUseCase(this._repository);

  final AuthAccountRepository _repository;

  Future<void> call(String id) => _repository.deleteDevice(id);
}
