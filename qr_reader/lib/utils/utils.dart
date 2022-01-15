import 'package:flutter/cupertino.dart';
import 'package:qr_reader/src/models/models.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(BuildContext context, ScanModel scan) async {
  if (scan.tipo == 'http') {
    if (!await launch(scan.valor)) throw 'Could not launch ${scan.valor}';
  } else {
    Navigator.pushNamed(context, 'map', arguments: scan);
  }
}
