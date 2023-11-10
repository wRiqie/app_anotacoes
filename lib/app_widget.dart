import 'package:app_anotacoes/app/core/theme/app_theme.dart';
import 'package:app_anotacoes/routes/app_pages.dart';
import 'package:app_anotacoes/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app/core/helpers/session_helper.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppPages.values,
      initialRoute: _handleFirstRoute(),
      theme: appTheme,
    );
  }

  String _handleFirstRoute() {
    final sessionHelper = GetIt.I<SessionHelper>();
    var actualSession = sessionHelper.actualSession;
    if (actualSession != null) {
      return AppRoutes.home;
    } else {
      return AppRoutes.signin;
    }
  }
}
