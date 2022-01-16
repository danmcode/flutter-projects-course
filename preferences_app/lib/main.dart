import 'package:flutter/material.dart';
import 'package:preferences_app/src/provider/theme_provider.dart';
import 'package:preferences_app/src/routes/app_routes.dart';
import 'package:preferences_app/src/utils/preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDarkmode: Preferences.isDarkmode),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'Home',
      routes: AppRoutes.appRoutes,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
