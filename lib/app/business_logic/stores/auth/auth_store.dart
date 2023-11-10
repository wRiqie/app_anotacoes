import 'package:app_anotacoes/app/data/models/auth_model.dart';
// import 'package:app_anotacoes/app/data/models/default_response_model.dart';
// import 'package:app_anotacoes/app/data/models/session_model.dart';
import 'package:app_anotacoes/app/data/repositories/auth_repository.dart';
import 'package:mobx/mobx.dart';

import '../../../core/helpers/session_helper.dart';

part 'auth_store.g.dart';

// ignore: library_private_types_in_public_api
class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final AuthRepository _authRepository;
  final SessionHelper _sessionHelper;

  @observable
  bool isLoading = false;
  @observable
  String? errorMessage = '';
  @observable
  bool isSuccess = false;

  _AuthStore(this._authRepository, this._sessionHelper);

  void _restart() {
    isLoading = false;
    errorMessage = null;
    isSuccess = false;
  }

  @action
  Future<void> signIn(AuthModel auth) async {
    _restart();
    isLoading = true;
    final response = await _authRepository.signIn(auth);

    if (response.isSuccess && response.data != null) {
      await _sessionHelper.saveSession(response.data!);
      isSuccess = true;
    } else {
      errorMessage = response.error?.message ??
          'Ocorreu um erro inesperado, tente novamente';
    }

    isLoading = false;
  }
}
