import 'package:flutter/material.dart';
import 'models/product.dart';

// Function menghitung total belanja
double hitungTotalBelanja(List<Product> keranjang) {
  double total = 0.0;
  for (var item in keranjang) {
    total += item.price;
  }
  return total;
}

// List 8 produk dummy untuk sumber data aplikasi
List<Product> dummyProducts = [
  Product(
    id: 'P01',
    name: 'Laptop Gaming Axioo',
    price: 12000000,
    imageUrl: 'https://picsum.photos/200/300?random=1',
    category: 'Elektronik',
    stock: 8,
    description: 'Laptop performa tinggi untuk kerja dan gaming.',
  ),
  Product(
    id: 'P02',
    name: 'Mouse Wireless',
    price: 150000,
    imageUrl: 'https://picsum.photos/200/300?random=2',
    category: 'Elektronik',
    stock: 3,
    description: 'Mouse ergonomis hemat energi.',
  ),
  Product(
    id: 'P03',
    name: 'Keyboard Mekanik',
    price: 450000,
    imageUrl: 'https://picsum.photos/200/300?random=3',
    category: 'Elektronik',
    stock: 0,
    description: null,
  ),
  Product(
    id: 'P04',
    name: 'Kemeja Flanel',
    price: 175000,
    imageUrl: 'https://picsum.photos/200/300?random=4',
    category: 'Fashion',
    stock: 12,
    description: 'Bahan katun lembut dan nyaman.',
  ),
  Product(
    id: 'P05',
    name: 'Sepatu Sneaker',
    price: 320000,
    imageUrl: 'https://picsum.photos/200/300?random=5',
    category: 'Fashion',
    stock: 4,
    description: 'Desain kasual cocok untuk harian.',
  ),
  Product(
    id: 'P06',
    name: 'Matcha Latte Box',
    price: 45000,
    imageUrl: 'https://picsum.photos/200/300?random=6',
    category: 'Makanan',
    stock: 20,
    description: 'Bubuk matcha murni isi 10 saset.',
  ),
  Product(
    id: 'P07',
    name: 'Cokelat Batang',
    price: 25000,
    imageUrl: 'https://picsum.photos/200/300?random=7',
    category: 'Makanan',
    stock: 15,
    description: null,
  ),
  Product(
    id: 'P08',
    name: 'Headphone Bluetooth',
    price: 350000,
    imageUrl: 'https://picsum.photos/200/300?random=8',
    category: 'Elektronik',
    stock: 2,
    description: 'Suara bass jernih dengan fitur noise canceling.',
  ),
];

void main() {
  runApp(const MyApp());

  print('=== DAFTAR 8 PRODUK DUMMY ===');
  for (var prod in dummyProducts) {
    print('${prod.name} | Rp${prod.price} | Stok: ${prod.stock} (${prod.getStatusStok()})');
  }

  print('\n=== SIMULASI TOTAL BELANJA ===');
  // Contoh memilih item index 0, 1, dan 5 ke keranjang
  List<Product> keranjang = [dummyProducts[0], dummyProducts[1], dummyProducts[5]];
  
  print('Barang di keranjang:');
  for (var item in keranjang) {
    print('- ${item.name} (Rp${item.price})');
  }

  double total = hitungTotalBelanja(keranjang);
  print('Total Harga Belanja: Rp$total');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('My Mobile App')),
        body: const Center(
          child: Text(
            'Logika Model & Belanja Berhasil Dijalankan!\nCek Terminal / Debug Console.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}