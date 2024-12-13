import 'package:flutter/material.dart';
import 'report_screen.dart';
import 'package:myapp/widgets/buttom_navbar.dart';
// import 'report_list_screen.dart';
// import 'profile_screen.dart'; // tambahkan import untuk profil screen

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pelaporan Fasilitas UNILA'),
      ),
      body: Stack(
        children: [
          // Gambar latar belakang
          Positioned.fill(
            child: Opacity(opacity: 0.3,
              child: Image.asset(
              'assets/images/UNILA.jpeg', // Sesuaikan dengan path gambar Anda
              fit: BoxFit.cover,
              ),
            ),
          ),
          // Konten utama
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ReportScreen()),
                    );
                  },
                  child: const Text('Lapor Fasilitas Rusak'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Navbar(currentIndex: 0),
    );
  }
}
