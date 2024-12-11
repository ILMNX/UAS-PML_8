import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ReportListScreen extends StatelessWidget {
  const ReportListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Laporan Fasilitas'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('reports').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Terjadi kesalahan saat memuat data.'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('Belum ada laporan yang tersedia.'));
          }

          final reports = snapshot.data!.docs;

          return ListView.builder(
            itemCount: reports.length,
            itemBuilder: (context, index) {
              final report = reports[index];
              final data = report.data() as Map<String, dynamic>;

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  leading: const Icon(Icons.report_problem, color: Colors.red),
                  title: Text(data['title'] ?? 'Laporan tanpa judul'),
                  subtitle: Text(data['description'] ?? 'Tidak ada deskripsi'),
                  trailing: Text(data['status'] ?? 'Status tidak diketahui'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReportDetailScreen(reportId: report.id),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ReportDetailScreen extends StatelessWidget {
  final String reportId;

  const ReportDetailScreen({super.key, required this.reportId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Laporan'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('reports').doc(reportId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || !snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text('Laporan tidak ditemukan.'));
          }

          final data = snapshot.data!.data() as Map<String, dynamic>;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Judul:', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(data['title'] ?? 'Tidak tersedia'),
                const SizedBox(height: 16),
                Text('Deskripsi:', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(data['description'] ?? 'Tidak tersedia'),
                const SizedBox(height: 16),
                Text('Status:', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(data['status'] ?? 'Tidak tersedia'),
              ],
            ),
          );
        },
      ),
    );
  }
}