import 'package:flutter/material.dart';

// Model produk sederhana
class Product {
  final String name;
  final int price;
  final bool isDiskon;

  Product({required this.name, required this.price, required this.isDiskon});
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  // Daftar 15 produk dummy sederhana
  final List<Product> productList = List.generate(
    15,
    (index) => Product(
      name: 'Produk TokoKita ${index + 1}',
      price: (index + 1) * 25000,
      isDiskon: index % 3 == 0, // Diskon tiap kelipatan 3
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TokoKita'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Header sederhana dengan Row & Column
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.blue.shade50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Katalog Produk',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Silakan pilih produk favoritmu',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const Icon(Icons.shopping_cart, color: Colors.blue),
              ],
            ),
          ),

          const Divider(height: 1),

          // 2. Daftar produk dengan ListView.builder
          Expanded(
            child: ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                final product = productList[index];

                // Container untuk pembungkus kartu produk dengan shadow & border radius
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(10.0), // Sudut melengkung
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey
                            .withOpacity(0.2), // Efek bayangan (shadow)
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3), // Posisi bayangan ke bawah
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // 3. Stack & Positioned untuk Badge Diskon Sederhana
                      Stack(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            color: Colors.grey.shade200,
                            child: const Icon(Icons.image, color: Colors.grey),
                          ),
                          if (product.isDiskon)
                            Positioned(
                              top: 2,
                              right: 2,
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                color: Colors.red,
                                child: const Text(
                                  'DISC',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(width: 12),

                      // 4. Expanded untuk teks nama dan harga
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Rp ${product.price}',
                              style: const TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
