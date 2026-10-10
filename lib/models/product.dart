class Product {
  String name;
  int price;
  String category;
  int stock;

  Product({
    required this.name,
    required this.price,
    required this.category,
    required this.stock,
  });

  // Method helper untuk status stok
  String getStatusStock() {
    if (stock > 5) {
      return 'Tersedia';
    } else if (stock > 0) {
      return 'Stok Terbatas';
    } else {
      return 'Habis';
    }
  }
}
