import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../widgets/custom_components.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang Belanja'),
        backgroundColor: AppThemeConfig.primaryColor,
      ),
      body: CartManager.items.isEmpty
          ? const Center(
              child: Text(
                'Keranjang Anda masih kosong',
                style: AppThemeConfig.primaryFont,
              ),
            )
          : ListView.builder(
              itemCount: CartManager.items.length,
              itemBuilder: (context, index) {
                final cartItem = CartManager.items[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(cartItem.product.name,
                        style: AppThemeConfig.primaryFont),
                    subtitle: Text('Jumlah: ${cartItem.quantity} item'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Rp ${cartItem.product.price * cartItem.quantity}',
                          style: AppThemeConfig.priceFont,
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: const Icon(Icons.delete_outline,
                              color: Colors.red),
                          onPressed: () {
                            setState(() {
                              CartManager.removeFromCart(cartItem.product);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    '${cartItem.product.name} dihapus dari keranjang'),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
