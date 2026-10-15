import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../models/product.dart';
import '../widgets/custom_components.dart';
import 'product_detail_page.dart';
import 'main_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final CartController cartController = Get.find<CartController>();

  final List<Product> dummyProducts = [
    Product(
      id: '1',
      name: 'Laptop Gaming ASUS',
      price: 12000000,
      imageUrl: '',
      category: 'Elektronik',
      stock: 5,
      description: 'Laptop gaming performa tinggi dengan kartu grafis terkini.',
    ),
    Product(
      id: '2',
      name: 'Sepatu Sneakers Nike',
      price: 1200000,
      imageUrl: '',
      category: 'Fashion',
      stock: 10,
      description: 'Sepatu sneakers nyaman untuk kegiatan sehari-hari.',
    ),
    Product(
      id: '3',
      name: 'Mechanical Keyboard',
      price: 750000,
      imageUrl: '',
      category: 'Elektronik',
      stock: 3,
      description: 'Keyboard mekanikal RGB dengan switch yang responsif.',
    ),
    Product(
      id: '4',
      name: 'Tas Ransel Laptop',
      price: 350000,
      imageUrl: '',
      category: 'Fashion',
      stock: 8,
      description: 'Tas ransel anti air dengan kompartemen laptop khusus.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TokoKita - Beranda'),
        backgroundColor: AppThemeConfig.primaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Obx(() {
              return Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart, color: Colors.white),
                    onPressed: () {
                      Get.offAll(() => const MainPage(initialIndex: 1));
                    },
                  ),
                  if (cartController.totalItem > 0)
                    Positioned(
                      right: 4,
                      top: 6,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Colors.redAccent,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${cartController.totalItem}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            }),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(bottom: 100),
        itemCount: dummyProducts.length,
        itemBuilder: (context, index) {
          final product = dummyProducts[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 2,
            child: ListTile(
              title: Text(product.name, style: AppThemeConfig.primaryFont),
              subtitle: Text(
                'Rp ${product.price.toStringAsFixed(0)} | Stok: ${product.stock}',
                style: AppThemeConfig.priceFont,
              ),
              trailing: CustomPrimaryButton(
                text: 'Detail',
                onPressed: () {
                  Get.to(() => ProductDetailPage(product: product));
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
