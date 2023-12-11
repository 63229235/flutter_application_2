// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/NCarrusel.dart';
import 'package:flutter_application_2/carousel_page.dart';
import 'package:flutter_application_2/login.dart';
import 'package:flutter_application_2/mapa.dart';
import 'package:flutter_application_2/mensajes.dart';
import 'package:flutter_application_2/nosotros.dart';
import 'package:flutter_application_2/opci.dart';
import 'package:flutter_application_2/opciones.dart';
import 'package:flutter_application_2/promociones.dart';
import 'package:flutter_application_2/routes/pages.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BakeryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bakery App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: BakeryOptionsScreen(),
    );
  }
}

class BakeryOptionsScreen extends StatefulWidget {
  @override
  _BakeryOptionsScreenState createState() => _BakeryOptionsScreenState();
}

class _BakeryOptionsScreenState extends State<BakeryOptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('El MAÑANERO'),
        backgroundColor: Color(0xFFE6B08B),
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MyAppForm(),
                ),
              );
            },
            icon: Icon(Icons.account_circle),
            label: Text('Perfil'),
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              elevation: 0,
            ),
          ),
          SizedBox(width: 10),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Mydasa(),
                ),
              );
            },
            icon: Icon(Icons.settings),
            label: Text('Configuración'),
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              elevation: 0,
            ),
          ),
        ],
      ),
      body: _buildLocation(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Color(0xFFE6B08B),
                image: DecorationImage(
                  image: AssetImage('assets/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          AssetImage('assets/images/Perfil flutter.jpg'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Alex',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Alex@hotmail.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.local_shipping),
              title: Text('Seguimiento de Pedidos'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.shop),
              title: Text('Tiendas'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => NCarrusel()));
              },
            ),
            ListTile(
              leading: Icon(Icons.breakfast_dining),
              title: Text('Promociones'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => MyOpcioness()));
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Acerca de Nosotros'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Chats'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Msjs()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocation() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'Routes.SPLASH',
      routes: appRoutes(),
    );
  }
}
