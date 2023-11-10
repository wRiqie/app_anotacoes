import 'package:app_anotacoes/app/data/data_sources/auth/auth_data_source.dart';
import 'package:app_anotacoes/app/data/models/auth_model.dart';
import 'package:app_anotacoes/app/data/models/default_response_model.dart';
import 'package:app_anotacoes/app/data/models/session_model.dart';
import 'package:app_anotacoes/app/data/services/execute_service.dart';

class AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepository(this._authDataSource);

  Future<DefaultResponseModel<SessionModel>> signIn(AuthModel auth) {
    return ExecuteService.tryExecuteAsync(() => _authDataSource.signIn(auth));
  }
}
