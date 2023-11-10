import 'package:app_anotacoes/app/data/models/auth_model.dart';
import 'package:app_anotacoes/app/data/models/session_model.dart';

abstract class AuthDataSource {
  Future<SessionModel> signIn(AuthModel auth);
}
