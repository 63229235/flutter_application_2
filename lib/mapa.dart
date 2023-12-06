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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: _controller.markers,
        onMapCreated: _controller.onMapCreated,
        initialCameraPosition: _controller.initialCameraPosition,
      ),
    );
  }
}
