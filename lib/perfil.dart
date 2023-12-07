// ignore_for_file: unused_import, library_private_types_in_public_api, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_2/afiliar.dart';
import 'package:flutter_application_2/avance.dart';
import 'package:flutter_application_2/opci.dart';
import 'package:flutter_application_2/registro.dart';
import 'package:flutter_application_2/seguridad.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  late String _name;
  late String _ubicacion;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 214, 166),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 90.0,
        ),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100.0,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('images/perfil.png'),
              ),
              Text(
                'PERFIL',
                style: TextStyle(
                    fontFamily: 'NerkoOne',
                    fontSize: 50.0,
                    color: Color.fromRGBO(239, 126, 12, 1)),
              ),
              SizedBox(
                width: 160.0,
                height: 15.0,
                child: Divider(color: Colors.brown[200]),
              ),
              Divider(
                height: 20.0,
              ),
              TextField(
                enableInteractiveSelection: false,
                autofocus: true,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                    hintText: 'USER-NAME',
                    labelText: 'User name',
                    suffixIcon: Icon(Icons.verified_user),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onSubmitted: (valor) {
                  _name = valor;
                  print('El nombre es $_ubicacion');
                },
              ),
              Divider(
                height: 20.0,
              ),
              TextField(
                enableInteractiveSelection: false,
                autofocus: true,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                    hintText: 'Distrito',
                    labelText: 'Ingrese su Distrito',
                    suffixIcon: Icon(Icons.add_location),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onSubmitted: (valor) {
                  _name = valor;
                  print('El nombre es $_name');
                },
              ),
              Divider(
                height: 20.0,
              ),
              TextField(
                enableInteractiveSelection: false,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password',
                    labelText: 'Password',
                    suffixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onSubmitted: (valor) {
                  _password = valor;
                  print('El password es $_password');
                },
              ),
              Divider(
                height: 18.0,
              ),
              SizedBox(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Mydasa()));
                  },
                  child: Text(
                    'Guardar Cambios',
                    style: TextStyle(
                        color: Color.fromARGB(179, 243, 125, 7),
                        fontSize: 30.0,
                        fontFamily: 'NerkoOne'),
                  ),
                ),
              ),
              Divider(
                height: 18.0,
              ),
            ],
          )
        ],
      ),
    );
  }
}
