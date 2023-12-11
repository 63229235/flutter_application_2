import 'package:flutter/material.dart';
import 'package:flutter_application_2/Inicio.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

void main() {
  runApp(MyOpcioness());
}

class MyOpcioness extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFE6B08B),
        colorScheme: ColorScheme.light(
          primary: Color(0xFFE6B08B),
          secondary: Colors.white,
        ),
        appBarTheme: AppBarTheme(
          elevation: 4,
        ),
        textTheme: TextTheme(
          headline6: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          subtitle1: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Color(0xFFE6B08B),
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promociones de Panaderías'),
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE6B08B),
              Color(0xFFC08457),
            ],
            begin: Alignment.topCenter,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            Text(
              '¡Aprovecha las promociones con un 30% de descuento en las tiendas mostradas!',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                children: [
                  Stack(
                    children: [
                      ImageSlideshow(
                        width: double.infinity,
                        height: 200,
                        indicatorColor: Colors.white,
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
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MyCombinedContainer(
                        imagePath: 'assets/images/34.jpg',
                        buttonText: 'Agregar a favoritos',
                        bottomText: 'Panadería Venezolana',
                      ),
                      MyCombinedContainer(
                        imagePath: 'assets/images/19.jpg',
                        buttonText: 'Agregar a favoritos',
                        bottomText: 'Panadería Miraflores',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCombinedContainer extends StatelessWidget {
  final String imagePath;
  final String buttonText;
  final String bottomText;

  const MyCombinedContainer({
    required this.imagePath,
    required this.buttonText,
    required this.bottomText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(buttonText),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Icon(
                Icons.favorite,
                size: 24,
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            left: 12,
            child: Text(
              bottomText,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ],
      ),
    );
  }
}
