import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader/src/providers/providers.dart';
import 'package:qr_reader/src/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Historial'),
        actions: [
          IconButton(
            onPressed: () {
              scanListProvider.borrarTodos();
            },
            icon: const Icon(Icons.delete_forever),
          ),
        ],
      ),
      body: const _HomePageBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Obtener el selected menu opt con el provider
    final uiProvider = Provider.of<UiProvider>(context);
    int currentIndex = uiProvider.selectedMenuOpt;

    //final tempScan = ScanModel(valor: "www.google.com");
    //Crear nuevo registro
    // DBProvider.db.newScan(tempScan);

    //Obtener los registros
    // DBProvider.db.getScanById(5).then((value) => print(value!.valor));

    //Usar el ScanList Provider
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScansPorTipo('geo');
        return const MapsHistoryScreen();
      case 1:
        scanListProvider.cargarScansPorTipo('http');
        return const AddressesScreen();
      default:
        scanListProvider.cargarScansPorTipo('geo');
        return const MapsHistoryScreen();
    }
  }
}
