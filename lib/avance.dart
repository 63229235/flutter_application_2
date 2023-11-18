// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/carousel_page.dart';
import 'package:flutter_application_2/login.dart';
import 'package:flutter_application_2/mapa.dart';
import 'package:flutter_application_2/nosotros.dart';
import 'package:flutter_application_2/opciones.dart';
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
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('El MAÑANERO'),
          backgroundColor: Color(0xFFE6B08B),
          actions: [
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyAppForm(),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ),
                );
              },
            ),
          ],
        ),
        body: _buildPage(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.restaurant_menu,
              ),
              label: 'Tiendas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: 'Ubicación',
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                color: Color(0xFFE6B08B), // Color cálido para panadería
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/2.jpg'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Fase Beta PIPIPI',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Inicio'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('Carrito de Compras'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.local_shipping),
                title: Text('Seguimiento de Pedidos'),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('Acerca de Nosotros'),
                onTap: () {
                  Route route = MaterialPageRoute(builder: (_) => MyAcerca());
                  Navigator.push(context, route);
                },
              ),
              ListTile(
                leading: Icon(Icons.contact_support),
                title: Text('Soporte'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.contact_support),
                title: Text('tiendas'),
                onTap: () {
                  Route route = MaterialPageRoute(builder: (_) => Carousel());
                  Navigator.push(context, route);
                },
              ),
            ],
          ),
        ));
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return _buildMenu();
      case 1:
        return _buildLocation();
      default:
        return Container();
    }
  }

  Widget _buildMenu() {
    return ListView();
  }

  Widget _buildLocation() {
    return Center(child: Mapa());
  }
}
