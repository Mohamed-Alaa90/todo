import 'package:flutter/material.dart';
import 'package:todo/screens/home/home.dart';
import 'package:todo/screens/splash/splash.dart';
import '../core/constants/strings.dart';

class AppRoutes {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (_) => Splash(),
        );

      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => Home(),
        );
    }
    return null;
  }
}
