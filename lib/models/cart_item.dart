import 'product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, required this.quantity});
}

class CartManager {
  static final List<CartItem> items = [];

  static void addToCart(Product product, int quantity) {
    final existingIndex =
        items.indexWhere((item) => item.product.id == product.id);
    if (existingIndex >= 0) {
      items[existingIndex].quantity += quantity;
    } else {
      items.add(CartItem(product: product, quantity: quantity));
    }
  }

  // Fungsi untuk menghapus produk dari keranjang
  static void removeFromCart(Product product) {
    items.removeWhere((item) => item.product.id == product.id);
  }
}
