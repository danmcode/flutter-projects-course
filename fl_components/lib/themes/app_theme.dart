import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.indigo;

  static final ThemeData lightTeme = ThemeData.light().copyWith(
    primaryColor: primary, // Color primario
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
    ),
  );
}
