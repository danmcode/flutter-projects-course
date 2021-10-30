import 'package:flutter/material.dart';

@immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TextStyle estiloTexto = TextStyle(fontSize: 25);

  final int conteo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Titulo"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Numero de taps',
              style: estiloTexto,
            ),
            Text(
              '$conteo',
              style: estiloTexto,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //print('Hola Mundo');
        },
      ),
    );
  }
}
