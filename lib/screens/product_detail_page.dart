import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/cart_item.dart';
import '../widgets/custom_components.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: AppThemeConfig.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              color: Colors.grey[200],
              child: const Icon(Icons.image, size: 80, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(product.name, style: AppThemeConfig.titleFont),
            const SizedBox(height: 8),
            Text('Harga: Rp ${product.price}', style: AppThemeConfig.priceFont),
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
                  // Masukkan produk ke CartManager
                  CartManager.addToCart(product, quantity);

                  // Kembali ke halaman sebelumnya dan bawa info jumlah
                  Navigator.pop(context, quantity);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
