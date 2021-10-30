import 'package:counter/src/pages/contador_page.dart';
//import 'package:counter/src/pages/home_page.dart';

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return MaterialApp(
      //home: HomePage(),
      home: ContadorPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
