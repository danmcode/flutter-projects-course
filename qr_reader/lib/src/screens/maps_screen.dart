import 'package:flutter/material.dart';
import 'package:qr_reader/src/models/models.dart';

class MapsScreen extends StatelessWidget {
  const MapsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScanModel? scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel?;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapas'),
      ),
      body: Center(
        child: Text(scan!.valor),
      ),
    );
  }
}
