import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../widgets/custom_components.dart';
import 'checkout_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang Belanja'),
        backgroundColor: AppThemeConfig.primaryColor,
        actions: [
          // Tombol Kosongkan Keranjang beserta konfirmasi (Tugas Mandiri 2)
          Obx(() {
            if (cartController.cartItems.isEmpty) return const SizedBox();
            return IconButton(
              icon: const Icon(Icons.delete_sweep, color: Colors.white),
              tooltip: 'Kosongkan Keranjang',
              onPressed: () {
                Get.defaultDialog(
                  title: 'Konfirmasi',
                  middleText:
                      'Apakah Anda yakin ingin mengosongkan seluruh isi keranjang?',
                  textCancel: 'Batal',
                  textConfirm: 'Ya, Kosongkan',
                  confirmTextColor: Colors.white,
                  buttonColor: Colors.redAccent,
                  onConfirm: () {
                    cartController.clearCart();
                    Get.back(); // Tutup dialog
                  },
                );
              },
            );
          }),
        ],
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return const Center(
            child: Text(
              'Keranjang Anda masih kosong',
              style: AppThemeConfig.primaryFont,
            ),
          );
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartController.cartItems[index];
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      title: Text(item.product.name,
                          style: AppThemeConfig.primaryFont),
                      subtitle: Text(
                        'Rp ${item.product.price.toStringAsFixed(0)} x ${item.quantity} = Rp ${(item.product.price * item.quantity).toStringAsFixed(0)}',
                        style: AppThemeConfig.priceFont,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Tombol kurang quantity (Tugas Mandiri 1)
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline,
                                color: Colors.cyan),
                            onPressed: () {
                              cartController.updateQuantity(item.product, -1);
                            },
                          ),
                          Text('${item.quantity}',
                              style: AppThemeConfig.primaryFont),
                          // Tombol tambah quantity (Tugas Mandiri 1)
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline,
                                color: Colors.cyan),
                            onPressed: () {
                              cartController.updateQuantity(item.product, 1);
                            },
                          ),
                          // Tombol hapus item
                          IconButton(
                            icon: const Icon(Icons.delete_outline,
                                color: Colors.red),
                            onPressed: () {
                              cartController.removeFromCart(item.product);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Panel Total Harga & Tombol Checkout di bagian bawah
            Container(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 10,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total Item:',
                          style: AppThemeConfig.primaryFont),
                      Text('${cartController.totalItem} barang',
                          style: AppThemeConfig.primaryFont),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total Harga:',
                          style: AppThemeConfig.titleFont),
                      Text(
                        'Rp ${cartController.totalHarga.toStringAsFixed(0)}',
                        style: AppThemeConfig.titleFont,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: CustomPrimaryButton(
                      text: 'Checkout Sekarang',
                      onPressed: () {
                        // Pindah ke halaman Checkout menggunakan Get.off() (Tugas Mandiri 3)
                        Get.off(() => const CheckoutPage());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
