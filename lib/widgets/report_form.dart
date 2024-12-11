import 'package:flutter/material.dart';
import '../services/firebase_service.dart';

class ReportForm extends StatefulWidget {
  const ReportForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ReportFormState createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _facilityController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _facilityController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitReport() {
    if (_formKey.currentState!.validate()) {
      FirebaseService.addReport(
        _facilityController.text,
        _descriptionController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Laporan berhasil dikirim')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _facilityController,
            decoration: const InputDecoration(labelText: 'Nama Fasilitas'),
            validator: (value) => value!.isEmpty ? 'Masukkan nama fasilitas' : null,
          ),
          TextFormField(
            controller: _descriptionController,
            decoration: const InputDecoration(labelText: 'Deskripsi Kerusakan'),
            maxLines: 3,
            validator: (value) => value!.isEmpty ? 'Masukkan deskripsi' : null,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _submitReport,
            child: const Text('Kirim'),
          ),
        ],
      ),
    );
  }
}
