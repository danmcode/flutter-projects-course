import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_reader/src/models/models.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({Key? key}) : super(key: key);

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_const
    final ScanModel? scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel?;

    final CameraPosition puntoInicial = CameraPosition(
      target: scan!.getLatLng(),
      zoom: 15,
      tilt: 50,
    );

    //Marcadores
    Set<Marker> markers = new Set<Marker>();

    markers.add(Marker(
      markerId: const MarkerId('geo-location'),
      position: scan.getLatLng(),
    ));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapas'),
        actions: [
          IconButton(
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: scan.getLatLng(),
                    zoom: 15,
                    tilt: 50,
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.center_focus_strong_rounded,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: GoogleMap(
        mapType: mapType,
        markers: markers,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.layers),
        onPressed: () {
          if (mapType == MapType.normal) {
            mapType = MapType.satellite;
          } else {
            mapType = MapType.normal;
          }
          setState(() {});
        },
      ),
    );
  }
}
