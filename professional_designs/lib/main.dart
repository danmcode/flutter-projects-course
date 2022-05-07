import 'package:disenos/src/pages/animaciones_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'package:disenos/src/pages/headers_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: AnimacionesPage(),
    );
  }
}
