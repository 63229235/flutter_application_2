import 'package:flutter/material.dart';
import 'package:flutter_application_2/opci.dart';
import 'package:permission_handler/permission_handler.dart';

class Mysegu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor:
            Colors.black, // Establecer el fondo de la aplicación a negro
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PermissionStatus _cameraPermissionStatus = PermissionStatus.permanentlyDenied;

  // Método para verificar el estado actual del permiso de la cámara
  Future<void> _checkCameraPermissionStatus() async {
    var status = await Permission.camera.status;
    setState(() {
      _cameraPermissionStatus = status;
    });
  }

  // Método para solicitar permisos
  Future<void> _requestPermission() async {
    var status = await Permission.camera.request();

    if (status.isGranted) {
      print("Permiso concedido");
    } else if (status.isDenied) {
      print("Permiso negado por el usuario");
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }

    _checkCameraPermissionStatus();
  }

  @override
  void initState() {
    super.initState();
    _checkCameraPermissionStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seguridad',
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Mydasa()));
          },
        ),
      ),
      body: Align(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            Container(
              width: 350,
              height: 50,
              color: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
                onPressed: () {
                  _requestPermission();
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Actividades realizadas ',
                    maxLines: 1,
                    overflow: TextOverflow
                        .ellipsis, // Mostrar puntos suspensivos (...) si el texto es muy largo
                    style: TextStyle(
                      color: Colors.white, // Color del texto en el botón
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              width: 350,
              height: 50,
              color: Colors.black, // Color del segundo contenedor
              padding: EdgeInsets.symmetric(
                  horizontal:
                      20.0), // Ajustar el espacio interno alrededor del texto
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black, // Color del botón (negro)
                ),
                onPressed: () {
                  _requestPermission();
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Historial de compras',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
