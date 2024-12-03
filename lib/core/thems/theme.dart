import 'package:flutter/material.dart';

import '../constants/my_colors.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: MyColor.primerColor),
    scaffoldBackgroundColor: MyColor.lightColor,
    appBarTheme: const AppBarTheme(
      toolbarHeight: 157.0,
      backgroundColor: MyColor.primerColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
      selectedItemColor: MyColor.primerColor,
      unselectedItemColor: MyColor.grayColor,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white),
      titleMedium: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
      titleSmall: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: false,

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: MyColor.primerColor),
    scaffoldBackgroundColor: MyColor.darkColor,
    appBarTheme: const AppBarTheme(
      toolbarHeight: 157.0,
      backgroundColor: MyColor.primerColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
      selectedItemColor: MyColor.primerColor,
      unselectedItemColor: MyColor.grayColor,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 22, fontWeight: FontWeight.w700, color: MyColor.darkColor),
      titleMedium: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w700, color: MyColor.darkColor),
      titleSmall: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w700, color: MyColor.darkColor),
    ),
  );
}
