import 'package:componentes/src/providers/menu_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    menuProvider.cargarData();

    return ListView(
      children: _listaItems(),
    );
  }

  List<Widget> _listaItems() {
    return [
      const ListTile(title: Text('Hola Mundo')),
      const Divider(),
      const ListTile(title: Text('Hola Mundo')),
      const Divider(),
      const ListTile(title: Text('Hola Mundo')),
      const Divider()
    ];
  }
}
