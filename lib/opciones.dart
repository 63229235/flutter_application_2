import 'package:flutter/material.dart';
import 'package:flutter_application_2/avance.dart';
import 'package:flutter_application_2/mensajes.dart';
import 'package:flutter_application_2/perfil.dart';
import 'package:flutter_application_2/privacidad.dart';
import 'package:flutter_application_2/seguridad.dart';
import 'package:flutter_application_2/tendencias.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';



class MyOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  void _navigateToPerfil(BuildContext context) {
    // Tu lógica de navegación a la pantalla de perfil
  }

  void _navigateToBakeryApp(BuildContext context) {
    // Tu lógica de navegación a la pantalla de BakeryApp
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Promos Panaderias'),
      backgroundColor: Color(0xFFE6B08B),
    ),
    drawer: Drawer(
      child: Container(
        color: Colors.black, // Establece el fondo del Drawer a negro
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              color: Color.fromARGB(255, 10, 5, 1),
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'Opciones',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.verified_user,color: Colors.white,),
              title: Text('Verificación de perfil'),
              textColor: Colors.white,
              onTap: () {
                Route route = MaterialPageRoute(builder: (_) => Perfil());
                Navigator.push(context, route);
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.privacy_tip,color: Colors.white),
              title: Text('Privacidad'),
              textColor: Colors.white,
              onTap: () {
                Route route = MaterialPageRoute(builder: (_) => Myts());
                Navigator.push(context, route);
              },
            ),
             const Divider(),
            ListTile(
              leading: Icon(Icons.security,color: Colors.white),
              title: Text('Seguridad'),
              textColor: Colors.white,
              onTap: () {
                Route route = MaterialPageRoute(builder: (_) => Mysegu());
                Navigator.push(context, route);
              },
            ),
             const Divider(),
            ListTile(
              leading: Icon(Icons.message,color: Colors.white),
              title: Text('Mensajes'),
              textColor: Colors.white,
              onTap: () {
                Route route = MaterialPageRoute(builder: (_) => Msjs());
                Navigator.push(context, route);
              },
            ),
             const Divider(),
            ListTile(
              leading: Icon(Icons.trending_up_sharp,color: Colors.white),
              title: Text('Tendencias'),
              textColor: Colors.white,
              onTap: () {
                Route route = MaterialPageRoute(builder: (_) => MyTe());
                Navigator.push(context, route);
              },
            ),
             const Divider(),
            ListTile(
              leading: Icon(Icons.logout,color: Colors.white),
              title: Text('Exit'),
              textColor: Colors.white,
              onTap: () {
                Route route = MaterialPageRoute(builder: (_) => BakeryApp());
                Navigator.push(context, route);
              },
            ),
          ],
        ),
      ),
    ),
    body: Column(
      children: [
        ImageSlideshow(
          width: double.infinity,
          height: 200,
          initialPage: 0,
          indicatorColor: Colors.black,
          indicatorBackgroundColor: Colors.grey,
          children: [
            Image.asset(
              'assets/images/19.jpg',
              fit: BoxFit.cover,
            ),
            Image.asset(
              'assets/images/56.jpg',
              fit: BoxFit.cover,
            ),
            Image.asset(
              'assets/images/34.jpg',
              fit: BoxFit.cover,
            ),
          ],
          onPageChanged: (value) {
            print('Página cambiada: $value');
          },
          autoPlayInterval: 3000,
          isLoop: true,
        ),
        const SizedBox(height: 16), // Espacio agregado entre los contenedores
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // Alineación espaciada
          children: [
            MyCombinedContainer(
              imagePath: 'assets/images/34.jpg',
            ),
            MyCombinedContainer(
              imagePath: 'assets/images/19.jpg',
            ),
          ],
        ),
      ],
    ),
  );
}

}

class MyCombinedContainer extends StatelessWidget {
  final String imagePath;

  const MyCombinedContainer({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                // Lógica a ejecutar cuando se presiona el botón

                // Muestra un SnackBar cuando se presiona el botón
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Aadasdasd'),
                    duration: Duration(seconds: 2),
                  ),
                );

                // Puedes agregar más lógica aquí si es necesario
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                onPrimary: Colors.transparent,
              ),
              child: Icon(
                Icons.add,
                size: 24,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Text(
              'Ag',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

