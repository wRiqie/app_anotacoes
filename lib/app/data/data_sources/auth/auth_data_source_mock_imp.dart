import 'package:app_anotacoes/app/data/data_sources/auth/auth_data_source.dart';
import 'package:app_anotacoes/app/data/models/session_model.dart';

import '../../models/auth_model.dart';

class AuthDataSourceMockImp implements AuthDataSource {
  @override
  Future<SessionModel> signIn(AuthModel auth) {
    return Future.delayed(const Duration(seconds: 3), () {
      return _mockSession.copyWith(email: auth.email);
    });
  }

  final _mockSession = SessionModel(
    id: '123',
    name: 'Usuário Teste',
  );
}
