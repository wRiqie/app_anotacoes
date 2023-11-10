import 'package:app_anotacoes/app/core/helpers/preferences_helper.dart';
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

    // Datasources

    // Data Services

    // Datasources
    getIt.registerLazySingleton<AuthDataSource>(() => AuthDataSourceMockImp());

    // Repositories
    getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(getIt()));
  }
}
