import 'package:get/get.dart';
import '../models/product.dart';
import '../models/cart_item.dart';

class CartController extends GetxController {
  // Variabel reaktif RxList untuk menyimpan daftar item keranjang
  final RxList<CartItem> cartItems = <CartItem>[].obs;

  // Menambahkan produk ke keranjang
  void addToCart(Product product, {int qty = 1}) {
    final index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      cartItems[index].quantity += qty;
      cartItems
          .refresh(); // Memicu pembaruan Obx saat properti internal berubah
    } else {
      cartItems.add(CartItem(product: product, quantity: qty));
    }
  }

  // Menghapus satu jenis produk dari keranjang
  void removeFromCart(Product product) {
    cartItems.removeWhere((item) => item.product.id == product.id);
  }

  // Mengubah jumlah (quantity) per item di halaman Keranjang (Tugas Mandiri 1)
  void updateQuantity(Product product, int delta) {
    final index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      final newQty = cartItems[index].quantity + delta;
      if (newQty > 0 && newQty <= product.stock) {
        cartItems[index].quantity = newQty;
        cartItems.refresh();
      } else if (newQty <= 0) {
        removeFromCart(product);
      }
    }
  }

  // Mengosongkan seluruh isi keranjang (Tugas Mandiri 2)
  void clearCart() {
    cartItems.clear();
  }

  // Getter reaktif total jumlah barang di keranjang
  int get totalItem => cartItems.fold(0, (sum, item) => sum + item.quantity);

  // Getter reaktif total harga seluruh barang di keranjang
  double get totalHarga => cartItems.fold(
      0, (sum, item) => sum + (item.product.price * item.quantity));
}
