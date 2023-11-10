import 'package:app_anotacoes/app/core/helpers/session_helper.dart';
import 'package:app_anotacoes/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app/core/helpers/preferences_helper.dart';
import 'app/core/inject.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Inject.init();
  await GetIt.I<PreferencesHelper>().init();
  await GetIt.I<SessionHelper>().init();

  runApp(const AppWidget());
}
