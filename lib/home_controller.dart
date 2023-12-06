import 'package:flutter_application_2/utils/map_style.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController {
  final Map<MarkerId, Marker> _markers = {};

  Set<Marker> get markers => _markers.values.toSet();

  final initialCameraPosition = CameraPosition(
    target: LatLng(-12.0467946, -77.0147041),
    zoom: 17,
  );

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
  }
}
