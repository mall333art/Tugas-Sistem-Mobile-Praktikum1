import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../widgets/custom_components.dart';
import 'main_page.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ringkasan Checkout'),
        backgroundColor: AppThemeConfig.primaryColor,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ringkasan Pesanan Anda:',
                style: AppThemeConfig.titleFont),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartController.cartItems[index];
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(item.product.name,
                        style: AppThemeConfig.primaryFont),
                    subtitle: Text(
                        '${item.quantity} x Rp ${item.product.price.toStringAsFixed(0)}'),
                    trailing: Text(
                      'Rp ${(item.product.price * item.quantity).toStringAsFixed(0)}',
                      style: AppThemeConfig.priceFont,
                    ),
                  );
                },
              ),
            ),
            const Divider(thickness: 1.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total Pembayaran:',
                    style: AppThemeConfig.titleFont),
                Text(
                  'Rp ${cartController.totalHarga.toStringAsFixed(0)}',
                  style: AppThemeConfig.titleFont,
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: CustomPrimaryButton(
                text: 'Konfirmasi & Selesaikan Pesanan',
                onPressed: () {
                  cartController.clearCart();
                  Get.snackbar(
                    'Pesanan Selesai',
                    'Terima kasih telah berbelanja di TokoKita!',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.teal,
                    colorText: Colors.white,
                  );
                  // Menggunakan Get.off() agar tidak bisa kembali ke halaman Checkout
                  Get.off(() => const MainPage());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
