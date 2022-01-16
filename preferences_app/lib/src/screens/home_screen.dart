import 'package:flutter/material.dart';
import 'package:preferences_app/src/utils/preferences.dart';
import 'package:preferences_app/src/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  //Nombre que se le dara en la ruta
  static const String routerName = 'Home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        drawer: const SideMenu(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Darkmode: ${Preferences.isDarkmode}'),
            const Divider(),
            Text('Genero: ${Preferences.gender}'),
            const Divider(),
            Text('Nombre de Usuario: ${Preferences.name}'),
            const Divider(),
          ],
        ));
  }
}
