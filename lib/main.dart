import 'package:flutter/material.dart';

import 'models/product.dart';
import 'widgets/product_card.dart';

void main() {
  runApp(const TokoKitaApp());
}

class TokoKitaApp extends StatelessWidget {
  const TokoKitaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TokoKita',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Daftar produk dummy
    final List<Product> dummyProducts = [
      Product(
        name: 'Laptop ASUS ROG',
        price: 15000000,
        category: 'Elektronik',
        stock: 4,
      ),
      Product(
        name: 'Sepatu Sneakers Nike',
        price: 1200000,
        category: 'Fashion',
        stock: 12,
      ),
      Product(
        name: 'Mechanical Keyboard',
        price: 750000,
        category: 'Elektronik',
        stock: 0,
      ),
      Product(
        name: 'Tas Ransel Laptop',
        price: 350000,
        category: 'Fashion',
        stock: 8,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('TokoKita - Praktikum 3')),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
        ),
        itemCount: dummyProducts.length,
        itemBuilder: (context, index) {
          return ProductCard(product: dummyProducts[index]);
        },
      ),
    );
  }
}
