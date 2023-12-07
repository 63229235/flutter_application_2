import 'package:flutter/material.dart';
import 'package:flutter_application_2/avance.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class Soport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactScreen(),
    );
  }
}

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _subjectController = TextEditingController();
  final _bodyController = TextEditingController();

  void _sendEmail() async {
    final Email email = Email(
      subject: _subjectController.text,
      body: _bodyController.text,
      recipients: ['soporte@appexample.com'],
    );

    try {
      await FlutterEmailSender.send(email);
      // Puedes mostrar un mensaje de éxito o navegar a otra pantalla aquí
    } catch (error) {
      // Manejar errores aquí, por ejemplo, mostrar un SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al enviar el correo electrónico'),
        ),
      );
    }
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text('Soporte'),
      backgroundColor:  Color(0xFFE6B08B), // Cambié el color a teal
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        decoration: BoxDecoration(
          //  fondo degradado 
          gradient: LinearGradient(
            colors: [Color (0xFFE6B08B), Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Asunto:', style: TextStyle(color: Colors.white)),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Fondo del asunto
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: _subjectController,
                  decoration: InputDecoration(
                    hintText: 'Ingresa el asunto',
                    contentPadding: EdgeInsets.all(12.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text('Mensaje:', style: TextStyle(color: Colors.white)),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Fondo del mensaje
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: _bodyController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Ingresa tu mensaje',
                    contentPadding: EdgeInsets.all(12.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _sendEmail,
                    child: Text('Enviar Correo'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black, // color del botón 
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


