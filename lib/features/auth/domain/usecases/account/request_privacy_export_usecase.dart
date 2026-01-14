import '../../repository/auth_account_repository.dart';
import '../../../../../core/utilities/json_map.dart';

class RequestPrivacyExportUseCase {
  RequestPrivacyExportUseCase(this._repository);

  final AuthAccountRepository _repository;

  Future<JsonMap> call() => _repository.requestPrivacyExport();
}
