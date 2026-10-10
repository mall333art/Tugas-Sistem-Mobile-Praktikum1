import 'package:flutter/material.dart';
import '../widgets/custom_components.dart';

class DetailScreen extends StatelessWidget {
  final String productName;
  const DetailScreen({Key? key, required this.productName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
        backgroundColor: const Color.fromARGB(255, 126, 124, 245),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey[300],
              child: const Icon(Icons.image, size: 80, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(productName, style: AppThemeConfig.titleFont),
            const SizedBox(height: 8),
            const Text('Rp 1.500.000', style: AppThemeConfig.priceFont),
            const SizedBox(height: 16),
            const Text(
                'Deskripsi singkat mengenai spesifikasi dan keunggulan produk ini di TokoKita.'),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomPrimaryButton(
                text: 'Tambah ke Keranjang',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Produk berhasil ditambahkan!')),
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
