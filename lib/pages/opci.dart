import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/avance.dart';
import 'package:flutter_application_2/pages/mensajes.dart';
import 'package:flutter_application_2/pages/perfil.dart';
import 'package:flutter_application_2/pages/privacidad.dart';
import 'package:flutter_application_2/pages/seguridad.dart';
import 'package:flutter_application_2/pages/tendencias.dart';

class Mydasa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Myqr(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Myqr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opciones'),
        backgroundColor: Color(0xFFE6B08B),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BakeryApp(),
              ),
            );
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          ListTile(
            leading: Icon(Icons.verified_user, color: Colors.black),
            title: Text('Verificación de perfil'),
            textColor: Colors.black,
            onTap: () {
              Route route = MaterialPageRoute(builder: (_) => Perfil());
              Navigator.push(context, route);
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.privacy_tip, color: Colors.black),
            title: Text('Privacidad'),
            textColor: Colors.black,
            onTap: () {
              Route route = MaterialPageRoute(builder: (_) => Myts());
              Navigator.push(context, route);
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.security, color: Colors.black),
            title: Text('Seguridad'),
            textColor: Colors.black,
            onTap: () {
              Route route = MaterialPageRoute(builder: (_) => Mysegu());
              Navigator.push(context, route);
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.message, color: Colors.black),
            title: Text('Mensajes'),
            textColor: Colors.black,
            onTap: () {
              Route route = MaterialPageRoute(builder: (_) => Msjs());
              Navigator.push(context, route);
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.trending_up_sharp, color: Colors.black),
            title: Text('Tendencias'),
            textColor: Colors.black,
            onTap: () {
              Route route = MaterialPageRoute(builder: (_) => MyTe());
              Navigator.push(context, route);
            },
          ),
        ],
      ),
    );
  }
}
