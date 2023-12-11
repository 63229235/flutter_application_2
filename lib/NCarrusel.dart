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
      Navigator.push(context, MaterialPageRoute(builder: (_) => Catalago()));
    },
    (context) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => Catalago2()));
    },
    (context) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => Catalago3()));
    },
    (context) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => Catalago4()));
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tiendas Afiliadas",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFEC7F5C), // Color similar a Rappi
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider.builder(
            itemCount: 4,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
              aspectRatio: 16 / 9,
              scrollDirection: Axis.horizontal,
              viewportFraction: 0.85,
              initialPage: 0,
              height: 300.0,
            ),
            carouselController: _carouselController,
            itemBuilder: (context, index, realIndex) {
              return _buildImageContainer(
                  'assets/images/${index + 1}.jpg', index);
            },
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
                    color: _currentIndex == index
                        ? Color(0xFFEC7F5C)
                        : Colors.grey, // Color de punto activo similar a Rappi
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
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Hero(
            tag: 'image_$index',
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
