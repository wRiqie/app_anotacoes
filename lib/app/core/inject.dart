import 'package:app_anotacoes/app/business_logic/stores/auth/auth_store.dart';
import 'package:app_anotacoes/app/business_logic/stores/obscure/obscure_store.dart';
import 'package:app_anotacoes/app/business_logic/stores/text/text_store.dart';
import 'package:app_anotacoes/app/core/helpers/dialog_helper.dart';
import 'package:app_anotacoes/app/core/helpers/preferences_helper.dart';
import 'package:app_anotacoes/app/core/helpers/session_helper.dart';
import 'package:app_anotacoes/app/data/repositories/auth_repository.dart';
import 'package:get_it/get_it.dart';

import '../data/data_sources/auth/auth_data_source.dart';
import '../data/data_sources/auth/auth_data_source_mock_imp.dart';

class Inject {
  Inject._();

  static void init() {
    final getIt = GetIt.I;

    // Helpers
    getIt.registerLazySingleton<PreferencesHelper>(() => PreferencesHelper());
    getIt.registerLazySingleton<SessionHelper>(() => SessionHelper(getIt()));
    getIt.registerLazySingleton<DialogHelper>(() => DialogHelper());

    // Data Services

    // Datasources
    getIt.registerLazySingleton<AuthDataSource>(() => AuthDataSourceMockImp());

    // Repositories
    getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(getIt()));

    // Stores
    getIt.registerLazySingleton<AuthStore>(() => AuthStore(getIt(), getIt()));
    getIt.registerLazySingleton<ObscureStore>(() => ObscureStore());
    getIt.registerLazySingleton<TextStore>(() => TextStore(getIt()));
  }
}
