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
        scaffoldBackgroundColor: Colors.black,
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

  Future<void> _checkCameraPermissionStatus() async {
    var status = await Permission.camera.status;
    setState(() {
      _cameraPermissionStatus = status;
    });
  }

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
          'Gestor de permisos',
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Myts()));
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
                  backgroundColor: Colors.black,
                ),
                onPressed: () {
                  _requestPermission();
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Permisos de la cámara',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              width: 350,
              height: 50,
              color: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                onPressed: () {
                  _requestPermission();
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Ir a Configuración de la Aplicación',
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
