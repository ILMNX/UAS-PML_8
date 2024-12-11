import 'package:flutter/material.dart';
import '../widgets/report_form.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Pelaporan'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: ReportForm(),
      ),
    );
  }
}
