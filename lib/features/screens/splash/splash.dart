import 'dart:async';
import 'package:flutter/material.dart';

import '../../../../core/constants/strings.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(
      const Duration(milliseconds: 2000),
      () {
        Navigator.popAndPushNamed(context, registerScreen);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Image.asset(fit: BoxFit.fill, "assets/splash_light.png"),
    );
  }
}
