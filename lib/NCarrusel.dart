import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_2/catalogo/Catalago.dart';
import 'package:flutter_application_2/catalogo/Catalago2.dart';
import 'package:flutter_application_2/catalogo/Catalago3.dart';
import 'package:flutter_application_2/catalogo/Catalago4.dart';

class NCarrusel extends StatefulWidget {
  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<NCarrusel> {
  int _currentIndex = 0;
  CarouselController _carouselController = CarouselController();
  List<Function(BuildContext)> _onTapFunctions = [
    (context) {
      Route route = MaterialPageRoute(builder: (_) => Catalago());
      Navigator.push(context, route);
    },
    (context) {
      Route route = MaterialPageRoute(builder: (_) => Catalago2());
      Navigator.push(context, route);
      print('Tocaste la segunda imagen');
    },
    (context) {
      Route route = MaterialPageRoute(builder: (_) => Catalago3());
      Navigator.push(context, route);
      print('Tocaste la tercera imagen');
    },
    (context) {
      Route route = MaterialPageRoute(builder: (_) => Catalago4());
      Navigator.push(context, route);
      print('Tocaste la cuarta imagen');
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tiendas Afiliadas"),
        backgroundColor: Color(0xFFE6B08B),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider(
            items: [
              _buildImageContainer('assets/images/1.jpg', 0),
              _buildImageContainer('assets/images/11.jpg', 1),
              _buildImageContainer('assets/images/12.jpg', 2),
              _buildImageContainer('assets/images/13.jpg', 3),
            ],
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
              aspectRatio: 16 / 9,
            ),
            carouselController: _carouselController,
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              return GestureDetector(
                onTap: () {
                  _carouselController.animateToPage(index);
                  _onTapFunctions[index](context);
                },
                child: Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index ? Colors.blue : Colors.grey,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildImageContainer(String imagePath, int index) {
    return GestureDetector(
      onTap: () => _onTapFunctions[index](context),
      child: Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
