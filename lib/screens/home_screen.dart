import 'package:flutter/material.dart';
import 'report_screen.dart';
import 'report_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pelaporan Fasilitas UNILA'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReportScreen()),
                );
              },
              child: const Text('Laporkan Fasilitas Rusak'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ReportListScreen()),
                );
              },
              child: const Text('Lihat Laporan'),
            ),
          ],
        ),
      ),
    );
  }
}
