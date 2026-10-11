import 'package:flutter/material.dart';
import 'screens/main_page.dart';
import 'screens/product_detail_page.dart';

void main() {
  runApp(const TokoKitaApp());
}

class TokoKitaApp extends StatelessWidget {
  const TokoKitaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TokoKita — Praktikum 5',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        useMaterial3: true,
      ),
      // Menjadikan MainPage sebagai halaman utama awal
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/detail': (context) => const ProductDetailPage(),
      },
    );
  }
}
