// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_2/avance.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LocalRegistrationScreen(),
    );
  }
}

class LocalRegistrationScreen extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController storeNameController = TextEditingController();
  final TextEditingController availabilityController = TextEditingController();
  final TextEditingController dniController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController rucController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Local'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // Agregamos SingleChildScrollView aquí
          child: Column(
            children: [
              TextFormField(
                controller: firstNameController,
                decoration: InputDecoration(labelText: 'Nombres'),
              ),
              TextFormField(
                controller: lastNameController,
                decoration: InputDecoration(labelText: 'Apellidos'),
              ),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Dirección'),
              ),
              TextFormField(
                controller: phoneNumberController,
                decoration: InputDecoration(labelText: 'Número de Teléfono'),
              ),
              TextFormField(
                controller: districtController,
                decoration: InputDecoration(labelText: 'Distrito'),
              ),
              TextFormField(
                controller: storeNameController,
                decoration: InputDecoration(labelText: 'Nombre del Local'),
              ),
              TextFormField(
                controller: availabilityController,
                decoration: InputDecoration(labelText: 'Disponibilidad'),
              ),
              TextFormField(
                controller: dniController,
                decoration: InputDecoration(labelText: 'DNI'),
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Correo Electrónico'),
              ),
              TextFormField(
                controller: rucController,
                decoration: InputDecoration(labelText: 'RUC'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BakeryOptionsScreen()));
                },
                child: Text('Registrar Local'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
