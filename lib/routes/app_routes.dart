import 'package:flutter/material.dart';
import 'package:todo/features/screens/home/home.dart';
import 'package:todo/features/screens/register/register.dart';
import 'package:todo/features/screens/splash/splash.dart';
import '../core/constants/strings.dart';
import '../features/screens/login/login.dart';

class AppRoutes {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (_) => const Splash(),
        );

      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => Home(),
        );

      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => Login(),
        );

      case registerScreen:
        return MaterialPageRoute(
          builder: (_) => Register(),
        );
    }
    return null;
  }
}
