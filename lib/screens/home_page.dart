import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/custom_components.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Product> dummyProducts = [
    Product(
        id: '1',
        name: 'Laptop Gaming ASUS',
        price: 12000000,
        imageUrl: '',
        category: 'Elektronik',
        stock: 5,
        description:
            'Laptop gaming performa tinggi dengan kartu grafis terkini.'),
    Product(
        id: '2',
        name: 'Sepatu Sneakers Nike',
        price: 1200000,
        imageUrl: '',
        category: 'Fashion',
        stock: 10,
        description: 'Sepatu sneakers nyaman untuk kegiatan sehari-hari.'),
    Product(
        id: '3',
        name: 'Mechanical Keyboard',
        price: 750000,
        imageUrl: '',
        category: 'Elektronik',
        stock: 3,
        description: 'Keyboard mekanikal RGB dengan switch yang responsif.'),
    Product(
        id: '4',
        name: 'Tas Ransel Laptop',
        price: 350000,
        imageUrl: '',
        category: 'Fashion',
        stock: 8,
        description: 'Tas ransel anti air dengan kompartemen laptop khusus.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TokoKita - Beranda'),
        backgroundColor: AppThemeConfig.primaryColor,
      ),
      body: ListView.builder(
        itemCount: dummyProducts.length,
        itemBuilder: (context, index) {
          final product = dummyProducts[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 2,
            child: ListTile(
              title: Text(product.name, style: AppThemeConfig.primaryFont),
              subtitle: Text('Rp ${product.price} | Stok: ${product.stock}',
                  style: AppThemeConfig.priceFont),
              trailing: CustomPrimaryButton(
                text: 'Detail',
                onPressed: () async {
                  // Navigasi menggunakan named route dan mengirim argumen Product, serta menunggu nilai kembalian
                  final result = await Navigator.pushNamed(
                    context,
                    '/detail',
                    arguments: product,
                  );

                  // Jika ada data yang dikembalikan dari Navigator.pop di halaman detail
                  if (result != null && context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              'Berhasil menambahkan $result item ke keranjang!')),
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
