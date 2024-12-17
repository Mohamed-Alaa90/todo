import 'package:flutter/material.dart';
import 'package:todo/routes/app_routes.dart';
import 'package:todo/core/thems/theme.dart';
import 'core/constants/strings.dart';

void main() {
  runApp(
    MyApp(
      AppRoutes(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp(this.appRoutes, {super.key});

  final AppRoutes appRoutes;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      initialRoute: splashScreen,
      onGenerateRoute: appRoutes.generateRoute,
    );
  }
}
