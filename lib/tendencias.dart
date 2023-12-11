import 'package:flutter/material.dart';
import 'package:flutter_application_2/opci.dart';
import 'package:flutter_application_2/car1.dart';
import 'package:flutter_application_2/car2.dart';
import 'package:flutter_application_2/car3.dart';
import 'package:flutter_application_2/car4.dart';
import 'package:flutter_application_2/opci.dart';
import 'package:flutter_application_2/seguridad.dart';

class MyTe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyTrendsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyTrendsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tendencias de Panaderías'),
        backgroundColor: Color(0xFFE6B08B),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Mydasa()),
            );
          },
        ),
      ),
      body: TrendList(),
    );
  }
}

class TrendList extends StatelessWidget {
  final List<String> trendingBakeries = [
    'Panadería Bakey',
    'Panaderia Don Mamino',
    'Panaderia San Antonio',
    'Rincón del Pan',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: trendingBakeries.length,
      itemBuilder: (context, index) {
        return TrendCard(bakeryName: trendingBakeries[index], index: index);
      },
    );
  }
}

class TrendCard extends StatelessWidget {
  final String bakeryName;
  final int index;

  TrendCard({required this.bakeryName, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (index) {
          case 0:
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => card1()),
            );
            break;
          case 1:
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => car2()),
            );
            break;
          case 2:
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => car3()),
            );
          case 3:
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => car4()),
            );

          default:
        }
      },
      child: Card(
        elevation: 3,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.local_restaurant_rounded),
              title: Text(bakeryName),
              subtitle:
                  Text('Descubre las delicias de ${bakeryName.toLowerCase()}'),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
