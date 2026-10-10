import 'package:flutter/material.dart';
import '../widgets/custom_components.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang Belanja'),
        backgroundColor: const Color.fromARGB(255, 255, 159, 130),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Daftar Belanjaan Anda:',
                style: AppThemeConfig.titleFont),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    title: Text('Laptop Gaming Axioo',
                        style: AppThemeConfig.primaryFont),
                    subtitle: Text('Jumlah: 1 item'),
                    trailing:
                        Text('Rp 12.000.000', style: AppThemeConfig.priceFont),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: CustomPrimaryButton(
                text: 'Checkout', // Menggunakan parameter 'text'
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Checkout Berhasil'),
                      content: const Text(
                          'Terima kasih telah berbelanja di TokoKita!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
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
