class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  final int stock;
  final String? description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.stock,
    this.description,
  });

  String getStatusStok() {
    return stock > 0 ? 'Tersedia ($stock)' : 'Habis';
  }

  String get info => '$name - Rp$price (Stok: $stock)';
}
