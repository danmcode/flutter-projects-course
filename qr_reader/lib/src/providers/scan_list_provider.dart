import 'package:flutter/material.dart';
import 'package:qr_reader/src/models/models.dart';
import 'package:qr_reader/src/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  //Nuevo scan
  newScan(String valor) async {
    final newScan = ScanModel(valor: valor);
    final id = await DBProvider.db.newScan(newScan);

    //Asignar el ID de la base de datos al modelo
    newScan.id = id;

    if (tipoSeleccionado == newScan.tipo) {
      scans.add(newScan);
      notifyListeners();
    }
  }

  cargarScan() async {
    final scans = await DBProvider.db.getAllScan();
    this.scans = [...scans!];
    notifyListeners();
  }

  cargarScansPorTipo(String tipo) async {
    final scans = await DBProvider.db.getAllScan();
    this.scans = [...scans!];
    tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos() async {
    await DBProvider.db.deleteAllScan();
    scans = [];
    notifyListeners();
  }

  borrarScanPorId(int id) async {
    await DBProvider.db.getScanById(id);
    cargarScansPorTipo(tipoSeleccionado);
  }
}
