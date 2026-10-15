import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../models/product.dart';
import '../widgets/custom_components.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final CartController cartController = Get.find<CartController>();
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: AppThemeConfig.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(), // Kembali menggunakan Get.back()
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Obx(() {
              return Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(Icons.shopping_cart, color: Colors.white),
                  if (cartController.totalItem > 0)
                    Positioned(
                      right: 0,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.redAccent,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${cartController.totalItem}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.cyan.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.image, size: 80, color: Colors.cyan),
            ),
            const SizedBox(height: 16),
            Text(product.name, style: AppThemeConfig.titleFont),
            const SizedBox(height: 8),
            Text(
              'Harga: Rp ${product.price.toStringAsFixed(0)}',
              style: AppThemeConfig.priceFont,
            ),
            const SizedBox(height: 8),
            Text('Kategori: ${product.category}',
                style: AppThemeConfig.primaryFont),
            const SizedBox(height: 8),
            Text('Status: ${product.getStatusStok()}'),
            const SizedBox(height: 12),
            Text('Deskripsi:\n${product.description ?? "Tidak ada deskripsi"}'),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text('Jumlah: ', style: AppThemeConfig.primaryFont),
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    if (quantity > 1) setState(() => quantity--);
                  },
                ),
                Text('$quantity', style: AppThemeConfig.titleFont),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () {
                    if (quantity < product.stock) setState(() => quantity++);
                  },
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomPrimaryButton(
                text: 'Tambah ke Keranjang',
                onPressed: () {
                  cartController.addToCart(product, qty: quantity);
                  Get.snackbar(
                    'Berhasil',
                    '${product.name} ($quantity item) ditambahkan ke keranjang',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.cyan.shade700,
                    colorText: Colors.white,
                    duration: const Duration(seconds: 2),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
