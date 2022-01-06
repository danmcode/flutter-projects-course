import 'package:flutter/material.dart';
import 'package:qr_reader/src/screens/screens.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> appRoutes = {
    'home': (_) => const HomeScreen(),
    'map': (_) => const MapsScreen(),
  };
}
