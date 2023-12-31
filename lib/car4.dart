import 'package:flutter_application_2/colors_filters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/tendencias.dart';
import 'package:flutter_application_2/Inicio.dart';

class car4 extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<car4> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Panaderias cerca de usted"),
          backgroundColor: Color.fromARGB(255, 185, 165, 73),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            buildQuoteCard(),
            //buildColoredCard(),
            //buildImageCard(),
            buildImageInteractionCard(),
            buildRoundedCard(),
          ],
        ),
      );

  Widget buildRoundedCard() => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Abierto: Lun-Dom 08:00-22:00',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Par5a realizar pedidos llamar al numero: 987-482-234',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      );
  Widget buildQuoteCard() => Card(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Panaderia Pasteleria Maria Almenara',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'Esta es unapequeña panaderia-pasteleria ubicada en el limite de Surco y Miraflores',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      );

  Widget buildColoredCard() => Card(
        shadowColor: Colors.red,
        elevation: 8,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.redAccent, Colors.red],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Colored card',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'This card is rounded and has a gradient',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildImageCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: NetworkImage(
                  'https://images.pexels.com/photos/18984929/pexels-photo-18984929/free-photo-of-calle-acera-panaderia-tienda.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
              colorFilter: ColorFilters.greyscale,
              child: InkWell(
                onTap: () {},
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
            Text(
              'Card With Splash',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      );

  Widget buildImageInteractionCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                      'https://grupogobesa.com/wp-content/gallery/maria-almenara-pasteleria/maria-almenara.jpeg'),
                  height: 240,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    'Maria Almenara',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'Ubicada a 1.5Km de usted',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      );
}
