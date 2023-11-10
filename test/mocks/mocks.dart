import 'package:app_anotacoes/app/core/helpers/preferences_helper.dart';
import 'package:app_anotacoes/app/core/helpers/session_helper.dart';
import 'package:app_anotacoes/app/data/data_sources/auth/auth_data_source.dart';
import 'package:app_anotacoes/app/data/repositories/auth_repository.dart';
import 'package:mocktail/mocktail.dart';

class SessionHelperMock extends Mock implements SessionHelper {}

class AuthRepositoryMock extends Mock implements AuthRepository {}

class PreferencesHelperMock extends Mock implements PreferencesHelper {}

class AuthDataSourceMock extends Mock implements AuthDataSource {}
