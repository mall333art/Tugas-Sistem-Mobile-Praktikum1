class Product {
<<<<<<< HEAD
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
=======
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  final int stock;
  final String? description; // Properti nullable (boleh null)

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.stock,
    this.description,
  });

  String get info => '$name - Rp$price (Stok: $stock)';

  // Method tambahan untuk cek status stok
  String getStatusStok() {
>>>>>>> 13db1c42d9ca642e6c5cd45ad6d317ac54e06148
    if (stock > 5) {
      return 'Tersedia';
    } else if (stock > 0) {
      return 'Stok Terbatas';
    } else {
      return 'Habis';
    }
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 13db1c42d9ca642e6c5cd45ad6d317ac54e06148
