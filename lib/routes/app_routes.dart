import 'package:flutter/material.dart';
import 'package:todo/auth/auth.dart';
import 'package:todo/screens/home/home.dart';
import 'package:todo/screens/register/register.dart';
import '../core/constants/strings.dart';
import '../screens/login/login.dart';
import '../screens/splash/splash.dart';

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
      case authScreen:
        return MaterialPageRoute(
          builder: (_) => Auth(),
        );
    }
    return null;
  }
}
