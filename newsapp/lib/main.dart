import 'package:flutter/material.dart';
import 'package:newsapp/src/screens/tabs_screen.dart';
import 'package:newsapp/src/theme/dark_teme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: const TabsScreen(),
    );
  }
}
