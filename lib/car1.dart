import 'package:flutter/material.dart';
import 'package:flutter_application_2/colors_filters.dart';
import 'package:flutter_application_2/tendencias.dart';
import 'package:flutter_application_2/avance.dart';

class Card1 extends StatefulWidget {
  @override
  _Card1State createState() => _Card1State();
}

class _Card1State extends State<Card1> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Panaderias cerca de usted"),
          backgroundColor: Color.fromARGB(255, 185, 165, 73),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            buildCard(
              title: 'Panaderia/pasteleria Bucky',
              content:
                  'Esta es una pequeña panaderia-pasteleria que realiza deliciosos preparados desde el año 1899, ¡anímate a probarlos!',
              isQuoteCard: true,
            ),
            buildCard(
              title: 'Colored card',
              content: 'This card is rounded and has a gradient',
              isColoredCard: true,
            ),
            buildCard(
              title: 'Backe med pasie',
              content: 'Ubicada a 1.5Km de usted',
              imageUrl:
                  'https://images.pexels.com/photos/18984929/pexels-photo-18984929/free-photo-of-calle-acera-panaderia-tienda.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              isImageInteractionCard: true,
            ),
          ],
        ),
      );

  Widget buildCard({
    required String title,
    String? content,
    String? imageUrl,
    bool isQuoteCard = false,
    bool isColoredCard = false,
    bool isImageInteractionCard = false,
  }) =>
      Card(
        elevation: 8,
        clipBehavior: Clip.antiAlias,
        shape: isImageInteractionCard
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              )
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
        child: isImageInteractionCard
            ? buildImageInteractionCard(title, imageUrl, content)
            : buildQuoteOrColoredCard(
                title, content, isQuoteCard, isColoredCard),
      );

  Widget buildQuoteOrColoredCard(String title, String? content,
          bool isQuoteCard, bool isColoredCard) =>
      Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: isQuoteCard ? 24 : 20,
                fontWeight: isQuoteCard ? FontWeight.bold : FontWeight.normal,
                color: isColoredCard ? Colors.white : null,
              ),
            ),
            if (content != null) ...[
              const SizedBox(height: 4),
              Text(
                content,
                style: TextStyle(fontSize: isQuoteCard ? 24 : 20),
              ),
            ],
          ],
        ),
      );

  Widget buildImageInteractionCard(
          String title, String? imageUrl, String? content) =>
      Column(
        children: [
          Stack(
            children: [
              Ink.image(
                image: NetworkImage(imageUrl!),
                height: 240,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Positioned(
                bottom: 16,
                right: 16,
                left: 16,
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16).copyWith(bottom: 0),
            child: Text(
              content!,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      );
}
