import 'package:flutter/material.dart';
import 'package:newsapp/src/screens/screens.dart';
import 'package:newsapp/src/services/services.dart';
import 'package:newsapp/src/theme/dark_teme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService()),
      ],
      child: MaterialApp(
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: const TabsScreen(),
      ),
    );
  }
}
