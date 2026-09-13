import 'package:flutter/material.dart';

import 'models/product.dart';

// --- LANGKAH 4: FUNCTIONS ---
double hitungHargaSetelahDiskon(double harga, {double persenDiskon = 0.0}) {
  return harga - (harga * (persenDiskon / 100));
}

// Arrow function untuk format rupiah
String formatRupiah(double nominal) => 'Rp${nominal.toStringAsFixed(0)}';

// --- TUGAS MANDIRI 3: FUNCTION TOTAL BELANJA ---
double hitungTotalBelanja(List<Product> keranjang) {
  double total = 0.0;
  for (var item in keranjang) {
    total += item.price;
  }
  return total;
}

// --- LANGKAH 5: CLASS INHERITANCE ---
class DiscountedProduct extends Product {
  final double discountPercent;

  DiscountedProduct({
    required super.id,
    required super.name,
    required super.price,
    required super.imageUrl,
    required super.category,
    required super.stock,
    super.description,
    required this.discountPercent,
  });

  double get finalPrice =>
      hitungHargaSetelahDiskon(price, persenDiskon: discountPercent);
}

// --- TUGAS MANDIRI 2: DUMMY PRODUCTS ---
List<Product> dummyProducts = [
  Product(
    id: 'P01',
    name: 'Laptop Gaming Axioo',
    price: 12000000,
    imageUrl: 'https://picsum.photos/200',
    category: 'Elektronik',
    stock: 8,
    description: 'Laptop gaming.',
  ),
  Product(
    id: 'P02',
    name: 'Mouse Wireless',
    price: 150000,
    imageUrl: 'https://picsum.photos/200',
    category: 'Elektronik',
    stock: 3,
    description: 'Mouse hemat energi.',
  ),
  Product(
    id: 'P03',
    name: 'Keyboard Mekanik',
    price: 450000,
    imageUrl: 'https://picsum.photos/200',
    category: 'Elektronik',
    stock: 0,
    description: null,
  ),
  Product(
    id: 'P04',
    name: 'Kemeja Flanel',
    price: 175000,
    imageUrl: 'https://picsum.photos/200',
    category: 'Fashion',
    stock: 12,
    description: 'Bahan katun.',
  ),
  Product(
    id: 'P05',
    name: 'Sepatu Sneaker',
    price: 320000,
    imageUrl: 'https://picsum.photos/200',
    category: 'Fashion',
    stock: 4,
    description: 'Desain kasual.',
  ),
  Product(
    id: 'P06',
    name: 'Matcha Latte Box',
    price: 45000,
    imageUrl: 'https://picsum.photos/200',
    category: 'Makanan',
    stock: 20,
    description: 'Matcha murni.',
  ),
  Product(
    id: 'P07',
    name: 'Cokelat Batang',
    price: 25000,
    imageUrl: 'https://picsum.photos/200',
    category: 'Makanan',
    stock: 15,
    description: null,
  ),
  Product(
    id: 'P08',
    name: 'Headphone Bluetooth',
    price: 350000,
    imageUrl: 'https://picsum.photos/200',
    category: 'Elektronik',
    stock: 2,
    description: 'Noise canceling.',
  ),
];

void main() {
  runApp(const MyApp());

  print('=== UJI LANGKAH 1: VARIABEL & TIPE DATA ===');
  const String namaToko = 'TokoKita';
  List<String> kategoriList = ['Elektronik', 'Fashion', 'Makanan'];
  Map<String, dynamic> rawProduct = {
    'id': 'P01',
    'nama': 'Headphone Bluetooth',
    'harga': 350000.0,
    'stok': 3,
  };
  print('Toko: $namaToko | Kategori: $kategoriList');
  print('Raw Product Map: $rawProduct\n');

  print('=== UJI LANGKAH 2: OPERATOR ===');
  double harga1 = 2500000.0;
  int jumlah = 2;
  double totalHarga = harga1 * jumlah;
  bool layakTampil = rawProduct['stok'] > 0 && rawProduct['harga'] > 0;
  print('Total Harga (2 item): $totalHarga | Layak Tampil: $layakTampil\n');

  print('=== UJI LANGKAH 3: CONTROL FLOW (WHILE & SWITCH) ===');
  int tempStok = 3;
  while (tempStok > 0) {
    tempStok--;
    print('Simulasi Pembelian: Barang dibeli, sisa stok: $tempStok');
  }
  String kat = 'Elektronik';
  double diskonKat = switch (kat) {
    'Elektronik' => 10.0,
    'Fashion' => 15.0,
    'Makanan' => 5.0,
    _ => 0.0,
  };
  print('Diskon kategori $kat: $diskonKat%\n');

  print('=== UJI LANGKAH 4: FUNCTION & ARROW FUNCTION ===');
  double hargaAwal = 500000;
  double setelahDiskon = hitungHargaSetelahDiskon(hargaAwal, persenDiskon: 10);
  print('Harga Normal: ${formatRupiah(hargaAwal)}');
  print('Harga Diskon (10%): ${formatRupiah(setelahDiskon)}\n');

  print('=== UJI LANGKAH 5: CLASS & INHERITANCE ===');
  var prodDiskon = DiscountedProduct(
    id: 'D01',
    name: 'Kemeja Casual',
    price: 200000,
    imageUrl: 'https://picsum.photos/200',
    category: 'Fashion',
    stock: 12,
    discountPercent: 15,
  );
  print('Info Produk: ${prodDiskon.info}');
  print(
    'Harga Akhir (Diskon ${prodDiskon.discountPercent}%): ${formatRupiah(prodDiskon.finalPrice)}\n',
  );

  print('=== DAFTAR 8 PRODUK DUMMY (TUGAS MANDIRI 1 & 2) ===');
  for (var prod in dummyProducts) {
    print(
      '${prod.name} | ${formatRupiah(prod.price)} | Stok: ${prod.stock} (${prod.getStatusStok()})',
    );
  }

  print('\n=== SIMULASI TOTAL BELANJA (TUGAS MANDIRI 3) ===');
  List<Product> keranjang = [
    dummyProducts[0],
    dummyProducts[1],
    dummyProducts[5],
  ];
  for (var item in keranjang) {
    print('- ${item.name} (${formatRupiah(item.price)})');
  }
  print('Total Harga Belanja: ${formatRupiah(hitungTotalBelanja(keranjang))}');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('TokoKita')),
        body: const Center(
          child: Text(
            'Cek Debug Console untuk melihat output pengamatan dan tugas mandiri.',
          ),
        ),
      ),
    );
  }
}
