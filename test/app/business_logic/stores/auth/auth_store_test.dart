import 'package:app_anotacoes/app/business_logic/stores/auth/auth_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mocks.dart';

void main() {
  group("[AuthStore]", () {
    var authRepository = AuthRepositoryMock();
    var sessionHelper = SessionHelperMock();
    late AuthStore authStore;

    setUp(() {
      authStore = AuthStore(authRepository, sessionHelper);
    });

    test('Deve logar com sucesso', () {
      // when((_) => authRepository.signIn(any()), () { })
    });
  });
}
