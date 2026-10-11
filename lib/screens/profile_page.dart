import 'package:flutter/material.dart';
import '../widgets/custom_components.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
        backgroundColor: AppThemeConfig.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.cyan,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            SizedBox(height: 16),
            Text('Muhammad Akmal Meiza', style: AppThemeConfig.titleFont),
            SizedBox(height: 8),
            Text('NIM: 3337240014', style: AppThemeConfig.primaryFont),
            SizedBox(height: 4),
            Text('Universitas Sultan Ageng Tirtayasa',
                style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
