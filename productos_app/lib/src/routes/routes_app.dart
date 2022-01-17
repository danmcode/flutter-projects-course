import 'package:flutter/material.dart';
import 'package:productos_app/src/screens/screens.dart';

class RoutesApp {
  static Map<String, Widget Function(BuildContext)> routesApp = {
    'home': (_) => const HomeScreen(),
    'login': (_) => const LoginScreen(),
  };
}
