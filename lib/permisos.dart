import 'package:flutter/material.dart';
import 'package:flutter_application_2/privacidad.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black, // Establecer el fondo de la aplicación a negro
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
      // El usuario concedió el permiso
      print("Permiso concedido");
    } else if (status.isDenied) {
      // El usuario negó el permiso
      print("Permiso negado por el usuario");
    } else if (status.isPermanentlyDenied) {
      // El usuario negó el permiso y seleccionó "No volver a preguntar"
      // Puedes redirigir al usuario a la configuración de la aplicación para habilitar manualmente el permiso
      openAppSettings();
    }

    // Actualiza el estado del permiso después de la solicitud
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
          'Gestor de permisos',
        ),
        backgroundColor: Colors.black, // Color de fondo de la AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Myts()));
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
              color: Colors.black, // Color del primer contenedor
              padding: EdgeInsets.symmetric(horizontal: 20.0), // Ajustar el espacio interno alrededor del texto
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
                    'Permisos de la cámara',
                    maxLines: 1, // Establecer el texto a una sola línea
                    overflow: TextOverflow.ellipsis, // Mostrar puntos suspensivos (...) si el texto es muy largo
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
              padding: EdgeInsets.symmetric(horizontal: 20.0), // Ajustar el espacio interno alrededor del texto
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
                    'Ir a Configuración de la Aplicación',
                    maxLines: 1, // Establecer el texto a una sola línea
                    overflow: TextOverflow.ellipsis, // Mostrar puntos suspensivos (...) si el texto es muy largo
                    style: TextStyle(
                      color: Colors.white, // Color del texto en el botón
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