import 'package:flutter/material.dart';
import 'package:flutter_application_2/home_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class Mapa extends StatelessWidget {
  const Mapa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeController>(
        create: (_) {
          final controller = HomeController();
          controller.onMarkerTap.listen((String id) {
            print("got to $id");
          });
          return controller;
        },
        child: Scaffold(
          body: Selector<HomeController, bool>(
            selector: (_, controller) => controller.loading,
            builder: (context, loading, loadingWidget) {
              if (loading) {
                return loadingWidget!;
              }
              return Consumer<HomeController>(
                builder: (_, controller, __) => GoogleMap(
                  markers: controller.markers,
                  onMapCreated: controller.onMapCreated,
                  initialCameraPosition: controller.initialCameraPosition,
                  onTap: controller.onTap,
                ),
              );
            },
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ));
  }
}
