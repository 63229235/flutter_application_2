import 'dart:async';
import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:flutter/material.dart';
import 'package:flutter_application_2/helpers/asset_to_bytes.dart';
import 'package:flutter_application_2/utils/map_style.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends ChangeNotifier {
  final Map<MarkerId, Marker> _markers = {};

  Set<Marker> get markers => _markers.values.toSet();

  final _markersController = StreamController<String>.broadcast();
  Stream<String> get onMarkerTap => _markersController.stream;

  final initialCameraPosition = const CameraPosition(
    target: LatLng(-12.0467946, -77.0147041),
    zoom: 17,
  );

  final _logoIcon = Completer<BitmapDescriptor>();

  bool _loading = true;
  bool get loading => _loading;

  HomeController() {
    _init();
  }

  Future<void> _init() async {
    final value = await assetToBytes('assets/Logo-Project.png');
    final bitmap = BitmapDescriptor.fromBytes(value);
    _logoIcon.complete(bitmap);

    _loading = false;
    notifyListeners();
  }

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
  }

  void onTap(LatLng position) async {
    final id = markers.length.toString();
    final markerId = MarkerId(id);
    final icon = await _logoIcon.future;
    final marker = Marker(
      markerId: markerId,
      position: position,
      draggable: true,
      icon: icon,
      anchor: const Offset(0.5, -1),
      onTap: () {
        _markersController.sink.add(id);
      },
      onDragEnd: (newPosition) {
        print("new position $newPosition");
      },
    );
    _markers[markerId] = marker;
    notifyListeners();
  }

  @override
  void dispose() {
    _markersController.close();
    super.dispose();
  }
}
