import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const TokoKitaQuizApp());
}

class TokoKitaQuizApp extends StatelessWidget {
  const TokoKitaQuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TokoKita Quiz',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
