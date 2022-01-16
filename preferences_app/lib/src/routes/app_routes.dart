import 'package:flutter/material.dart';
import 'package:preferences_app/src/screens/screens.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> appRoutes = {
    HomeScreen.routerName: (_) => const HomeScreen(),
    SettingsScreen.routerName: (_) => const SettingsScreen(),
  };
}
