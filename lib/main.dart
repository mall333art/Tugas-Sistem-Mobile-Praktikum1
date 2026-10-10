import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const TokoKitaApp());
}

class TokoKitaApp extends StatelessWidget {
  const TokoKitaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TokoKita',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
