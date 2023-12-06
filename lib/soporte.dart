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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacto'),
        backgroundColor: Color(0xFFE6B08B),  // Establece el color de fondo aquí
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Asunto:'),
            TextField(
              controller: _subjectController,
              decoration: InputDecoration(
                hintText: 'Ingresa el asunto',
              ),
            ),
            SizedBox(height: 16.0),
            Text('Mensaje:'),
            TextField(
              controller: _bodyController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Ingresa tu mensaje',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _sendEmail,
              child: Text('Enviar Correo'),
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // Establece el color del botón aquí
              ),
            ),
          ],
        ),
      ),
    );
  }
}
