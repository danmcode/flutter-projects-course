import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/src/providers/scan_list_provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //     '#3D88EF', 'Cancelar', false, ScanMode.QR);
        String barcodeScanRes = 'https://omega.proteccionenlinea.co';

        //Realizar la insercion en la base de datos
        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);

        scanListProvider.newScan(barcodeScanRes);
        scanListProvider.newScan('geo:15.33.15.66');
      },
      child: const Icon(Icons.qr_code_2_rounded),
    );
  }
}
