import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NCarrusel extends StatefulWidget {
  @override
  _NCarruselState createState() => _NCarruselState();
}

class _NCarruselState extends State<NCarrusel> {
  int _currentIndex = 0;
  CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE6B08B),
        title: Text('Tiendas Afiliadas'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CarouselSlider(
              items: [
                _buildImageContainer('assets/images/1.jpg'),
                _buildImageContainer('assets/images/2.jpg'),
                _buildImageContainer('assets/images/11.jpg'),
                _buildImageContainer('assets/images/12.jpg'),
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
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              return GestureDetector(
                onTap: () {
                  _carouselController.animateToPage(index);
                  _onImageTap(index);
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

  Widget _buildImageContainer(String imagePath) {
    return Container(
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
    );
  }

  void _onImageTap(int index) {
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (_) => MyAcerca()));
        break;
      case 1:
        // Agrega la navegación para la segunda imagen
        break;
      case 2:
        // Agrega la navegación para la tercera imagen
        break;
      case 3:
        // Agrega la navegación para la cuarta imagen
        break;
      default:
        break;
    }
  }
}

class MyAcerca extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE6B08B),
        title: Text('Acerca de'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Contenido de la página Acerca de',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}
