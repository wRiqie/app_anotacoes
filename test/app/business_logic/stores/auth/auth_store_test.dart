import 'package:app_anotacoes/app/business_logic/stores/auth/auth_store.dart';
import 'package:app_anotacoes/app/data/models/auth_model.dart';
import 'package:app_anotacoes/app/data/models/default_response_model.dart';
import 'package:app_anotacoes/app/data/models/error_model.dart';
import 'package:app_anotacoes/app/data/models/session_model.dart';
import 'package:flutter_test/flutter_test.dart';
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

    final mockAuth = AuthModel(user: 'test123', password: 'teste123');
    final mockSession = SessionModel(id: '', email: '', name: '');

    test('Deve logar com sucesso', () async {
      when(() => authRepository.signIn(mockAuth))
          .thenAnswer((_) async => DefaultResponseModel(data: mockSession));
      when(() => sessionHelper.saveSession(mockSession))
          .thenAnswer((_) async {});
      await authStore.signIn(mockAuth);

      expect(authStore.isSuccess, isTrue);
      expect(authStore.errorMessage, isNull);
      expect(authStore.isLoading, isFalse);
    });

    test('Deve dar erro de credenciais', () async {
      const errorMsg = 'Credenciais inválidas';

      when(() => authRepository.signIn(mockAuth)).thenAnswer(
          (_) async => DefaultResponseModel(error: ErrorModel(errorMsg)));

      await authStore.signIn(mockAuth);

      expect(authStore.isSuccess, isFalse);
      expect(authStore.errorMessage, equals(errorMsg));
      expect(authStore.isLoading, isFalse);
    });

    test('Deve dar erro inesperado', () async {
      const errorMsg = 'Ocorreu um erro inesperado, tente novamente';

      when(() => authRepository.signIn(mockAuth))
          .thenAnswer((_) async => DefaultResponseModel());

      await authStore.signIn(mockAuth);

      expect(authStore.isSuccess, isFalse);
      expect(authStore.errorMessage, equals(errorMsg));
      expect(authStore.isLoading, isFalse);
    });
  });
}
