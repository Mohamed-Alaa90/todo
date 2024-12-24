import 'package:flutter/material.dart';
import '../core/constants/strings.dart';
import '../core/thems/theme.dart';
import '../routes/app_routes.dart';

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
