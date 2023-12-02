import 'package:flutter/material.dart';
import 'package:flutter_application_2/home_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapa extends StatefulWidget {
  const Mapa({super.key});

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  final _controller = HomeController();

  final _initialCameraPosition = CameraPosition(
    target: LatLng(-12.0467946, -77.0147041),
    zoom: 17,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _controller.onMapCreated,
        initialCameraPosition: _initialCameraPosition,
        myLocationButtonEnabled: false,
      ),
    );
  }
}
