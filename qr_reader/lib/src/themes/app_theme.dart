import 'package:flutter/material.dart';

class AppTheme {
  static const deepPurple = Colors.deepPurple;

  static ThemeData lightTeme = ThemeData.light().copyWith(
    primaryColor: deepPurple,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: deepPurple,
    ),
    appBarTheme: const AppBarTheme(backgroundColor: deepPurple),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(selectedItemColor: deepPurple),
  );
}
