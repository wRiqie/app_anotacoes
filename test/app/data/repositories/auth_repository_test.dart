import 'package:app_anotacoes/app/data/models/auth_model.dart';
import 'package:app_anotacoes/app/data/models/default_response_model.dart';
import 'package:app_anotacoes/app/data/models/error_model.dart';
import 'package:app_anotacoes/app/data/models/session_model.dart';
import 'package:app_anotacoes/app/data/repositories/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/mocks.dart';

void main() {
  group('[AuthRepository]', () {
    final authDataSource = AuthDataSourceMock();
    late AuthRepository authRepository;

    setUp(() {
      authRepository = AuthRepository(authDataSource);
    });

    final mockAuth = AuthModel(user: '', password: '');

    test('Deve logar com sucesso', () async {
      when(() => authDataSource.signIn(mockAuth))
          .thenAnswer((_) async => SessionModel());

      var response = await authRepository.signIn(mockAuth);

      expect(response, isA<DefaultResponseModel<SessionModel>>());
      expect(response.data, isNotNull);
      expect(response.error, isNull);
    });

    test('Deve dar erro ao tentar logar', () async {
      const errorMsg = 'Credenciais incorretas';

      when(() => authDataSource.signIn(mockAuth))
          .thenThrow(ErrorModel(errorMsg));

      var response = await authRepository.signIn(mockAuth);

      expect(response, isA<DefaultResponseModel<SessionModel>>());
      expect(response.data, isNull);
      expect(response.error?.message, equals(errorMsg));
    });
  });
}
