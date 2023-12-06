import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/avance.dart';
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
        title: Text('Promos Panaderias'),
        backgroundColor: Color(0xFFE6B08B),
        // Añadir un ícono de flecha de retroceso en la parte superior izquierda
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
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  const Color(0xFFE6B08B),
                  const Color(0x00EF5350),
                ],
                begin: Alignment.topCenter,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Aprovecha las promociones de 30% de descuento en las tiendas mostradas',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 16.0,
                    ),
                    children: [
                      ImageSlideshow(
                        width: double.infinity,
                        height: 200,
                        initialPage: 0,
                        indicatorColor: const Color(0xFFE6B08B),
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
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MyCombinedContainer(
                            imagePath: 'assets/images/34.jpg',
                            buttonText:
                                ' bakery Agregada tu panaderia favorita',
                            bottomText: 'Venezolana',
                          ),
                          MyCombinedContainer(
                            imagePath: 'assets/images/19.jpg',
                            buttonText:
                                'Panaderia Rosa Agregada a tu panaderia favorita',
                            bottomText: 'Miraflores',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(buttonText),
                    duration: Duration(seconds: 2),
                  ),
                );
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
              bottomText,
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
