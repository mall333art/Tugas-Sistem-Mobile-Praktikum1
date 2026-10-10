import 'package:flutter/material.dart';

class AppThemeConfig {
  // Mengubah warna utama menjadi Cyan (Blue Cyan)
  static const Color primaryColor = Colors.cyan;

  static const TextStyle primaryFont = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  static const TextStyle titleFont = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: primaryColor,
  );

  static const TextStyle priceFont = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.teal, // Disesuaikan agar serasi dengan cyan
  );
}

class CustomPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomPrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppThemeConfig.primaryColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
