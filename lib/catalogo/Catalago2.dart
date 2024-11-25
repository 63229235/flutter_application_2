import 'package:flutter/material.dart';

class Product {
  final String name;
  final String description;
  final double price;
  final String image;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
}

class Catalago2 extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Pan integral',
      description: 'Descripción del Producto 1',
      price: 0.50,
      image: 'assets/images/pan1.jpg',
    ),
    Product(
      name: 'Pan frances',
      description: 'Descripción del Producto 2',
      price: 1.99,
      image: 'assets/images/Pan2.jpeg',
    ),
    Product(
      name: 'Pan de yema',
      description: 'Descripción del Producto 3',
      price: 1.50,
      image: 'assets/images/Pan3.jpg',
    ),
    Product(
      name: 'Cachito de manjar',
      description: 'Descripción del Producto 4',
      price: 2.00,
      image: 'assets/images/Pan4.jpeg',
    ),
    Product(
      name: 'Cachito Mixto',
      description: 'Descripción del Producto 5',
      price: 1.00,
      image: 'assets/images/Pan5.jpg',
    ),
    Product(
      name: 'Cachito de mantequilla',
      description: 'Descripción del Producto 6',
      price: 3.00,
      image: 'assets/images/Pan6.jpg',
    ),
    Product(
      name: 'Pan chapla',
      description: 'Descripción del Producto 7',
      price: 3.00,
      image: 'assets/images/Pan7.jpg',
    ),
    Product(
      name: 'Pan camote',
      description: 'Descripción del Producto 8',
      price: 2.00,
      image: 'assets/images/Pan8.jpg',
    ),
    Product(
      name: 'Tostada integral',
      description: 'Descripción del Producto 8',
      price: 1.50,
      image: 'assets/images/Pan9.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    '¡Descubre Nuestros Productos!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
                ProductGrid(products: products),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductGrid extends StatelessWidget {
  final List<Product> products;

  ProductGrid({required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Hero(
          tag: 'product_hero_${products[index].name}',
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.only(bottom: 8.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailPage(product: products[index]),
                ));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10.0)),
                    child: Image.asset(
                      products[index].image,
                      height: 60.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products[index].name,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '\$${products[index].price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(height: 5),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: Colors.deepOrange, padding: EdgeInsets.symmetric(horizontal: 4),
                          ),
                          child: Text('Agregar'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Producto'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: 'product_hero_${product.name}',
            child: Image.asset(
              product.image,
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  product.description,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
