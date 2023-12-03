import 'package:flutter/material.dart';
import 'package:flutter_application_2/avance.dart';
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

class MyHome extends StatelessWidget {
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
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyCombinedContainer(
                imagePath: 'assets/images/34.jpg',
                buttonText: ' bakery Agregada tu panaderia favorita',
                bottomText: 'bakery',
              ),
              MyCombinedContainer(
                imagePath: 'assets/images/19.jpg',
                buttonText: 'Panaderia Rosa Agregada a tu panaderia favorita',
                bottomText: 'Panaderia Rosa',
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