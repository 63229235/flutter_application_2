import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_2/pages/recetas_data.dart';
import 'package:flutter_application_2/pages/model_recetas.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/catalogo/Catalago.dart';

class Carousel extends StatefulWidget {
  final Receta? carruselImages;
  const Carousel({
    Key? key,
    this.carruselImages,
  }) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 200, 83),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 254, 200, 83),
        elevation: 0,
        title: const Text("Slider de panaderias"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          CarouselSlider.builder(
            itemCount: carruselImages.length,
            itemBuilder: (context, index, realIndex) {
              // ignore: unused_local_variable
              final carruselImage = carruselImages[index];
              return CardImages(
                carruselImages: carruselImages[index],
              );
            },
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              autoPlayCurve: Curves.easeInOut,
              enlargeCenterPage: true,
              autoPlayInterval: const Duration(seconds: 5),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}

class CardImages extends StatelessWidget {
  final Receta carruselImages;
  const CardImages({Key? key, required this.carruselImages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          splashColor: Colors.red,
          onTap: () {
            carruselImages.copy();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Catalago()));
          },
          child: FadeInImage(
            placeholder: const AssetImage("assets/loading1.gif"),
            image: AssetImage(carruselImages.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
