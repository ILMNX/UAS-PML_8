import 'package:flutter/material.dart';
import 'package:myapp/widgets/buttom_navbar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage('https://picsum.photos/200/300'),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Hafizh Tau', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const Text('2217051093', style: TextStyle(fontSize: 16, color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text('Informasi Profil', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ListTile(
              title: const Text('Nama'),
              subtitle: const Text('Hafizh Tau'),
            ),
            ListTile(
              title: const Text('Jurusan'),
              subtitle: const Text('Ilmu Komputer'),
            ),
            ListTile(
              title: const Text('NPM'),
              subtitle: const Text('2217051093'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Navbar(currentIndex: _currentIndex),
    );
  }
}