import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/src/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D88EF', 'Cancelar', false, ScanMode.QR);
        // String barcodeScanRes = 'https://omega.proteccionenlinea.co';
        //String barcodeScanRes = 'geo:3.414560073711881,-76.53677010883278';

        if (barcodeScanRes == '-1') {
          return;
        }

        //Realizar la insercion en la base de datos
        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);

        final newScan = await scanListProvider.newScan(barcodeScanRes);
        //scanListProvider.newScan('geo:15.33.15.66');

        launchURL(context, newScan);
      },
      child: const Icon(Icons.qr_code_2_rounded),
    );
  }
}
