import 'package:app_anotacoes/app/ui/screens/home_screen.dart';
import 'package:app_anotacoes/app/ui/screens/signin_screen.dart';
import 'package:flutter/material.dart';

import 'app_routes.dart';

class AppPages {
  static Map<String, Widget Function(BuildContext context)> values = {
    AppRoutes.signin: (context) => const SigninScreen(),
    AppRoutes.home: (context) => const HomeScreen(),
  };
}
