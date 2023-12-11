// ignore_for_file: unused_import, prefer_const_constructors, library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Inicio.dart';
import 'package:flutter_application_2/perfil.dart';
import 'package:flutter_application_2/registro.dart';

class Afiliologin extends StatefulWidget {
  const Afiliologin({Key? key}) : super(key: key);

  @override
  _AfiliologinState createState() => _AfiliologinState();
}

class _AfiliologinState extends State<Afiliologin> {
  late String _name;
  late String _email;
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
                backgroundImage: AssetImage('images/Logo-Project.png'),
              ),
              Text(
                'INICIAR SESION',
                style: TextStyle(
                    fontFamily: 'NerkoOne',
                    fontSize: 50.0,
                    color: Color.fromARGB(255, 239, 126, 12)),
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
                    hintText: 'RUC',
                    labelText: 'RUC',
                    suffixIcon: Icon(Icons.verified_user),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onSubmitted: (valor) {
                  _name = valor;
                  print('El nombre es $_name}}');
                },
              ),
              Divider(
                height: 20.0,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                    suffixIcon: Icon(Icons.alternate_email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onSubmitted: (valor) {
                  _email = valor;
                  print('El email es $_email');
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BakeryOptionsScreen()));
                  },
                  child: Text(
                    'Ingresar',
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
              SizedBox(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Registro()));
                  },
                  child: Text(
                    'Registrate',
                    style: TextStyle(
                        color: Color.fromARGB(179, 243, 125, 7),
                        fontSize: 23.0,
                        fontFamily: 'NerkoOne'),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
