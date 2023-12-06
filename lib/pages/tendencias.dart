import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/opci.dart';
import 'package:flutter_application_2/pages/car1.dart';
import 'package:flutter_application_2/pages/car2.dart';
import 'package:flutter_application_2/pages/car3.dart';
import 'package:flutter_application_2/pages/car4.dart';
import 'package:flutter_application_2/pages/opci.dart';
import 'package:flutter_application_2/pages/seguridad.dart';

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
        child: TrendList(),
      ),
    );
  }
}

class TrendList extends StatelessWidget {
  final List<String> trendingBakeries = [
    'Panadería Bakey',
    'Panaderia Dulce',
    'El panadero cerca a tu hogar',
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
        // Redirigir a una ventana diferente según el índice
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
            break;
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
              leading: Icon(Icons.local_cafe),
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
