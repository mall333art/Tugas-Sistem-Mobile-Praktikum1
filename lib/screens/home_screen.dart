import 'package:flutter/material.dart';
import '../widgets/custom_components.dart';
import 'detail_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> products = [
      'Laptop Gaming',
      'Sepatu Sneakers',
      'Mechanical Keyboard',
      'Tas Ransel'
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('TokoKita - Home'),
        backgroundColor: AppThemeConfig.primaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartScreen()));
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.shopping_bag,
                  color: AppThemeConfig.primaryColor),
              title: Text(products[index], style: AppThemeConfig.titleFont),
              subtitle: const Text('Tap untuk melihat detail produk'),
              trailing: CustomPrimaryButton(
                text: 'Beli',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailScreen(productName: products[index]),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
