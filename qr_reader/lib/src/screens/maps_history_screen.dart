import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/src/providers/providers.dart';
import 'package:qr_reader/src/widgets/widgets.dart';

class MapsHistoryScreen extends StatelessWidget {
  const MapsHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScanTiles(tipo: 'geo');
  }
}
