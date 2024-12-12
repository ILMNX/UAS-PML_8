import 'dart:io'; // Tambahkan impor ini
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../services/firebase_service.dart';

class ReportForm extends StatefulWidget {
  const ReportForm({super.key});

  @override
  _ReportFormState createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _facilityController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  XFile? _image; // Variabel untuk menampung gambar yang dipilih

  @override
  void dispose() {
    _facilityController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? selectedImage = await showDialog<XFile>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pilih Sumber Gambar'),
          actions: [
            TextButton(
              child: const Text('Kamera'),
              onPressed: () async {
                Navigator.of(context).pop(await picker.pickImage(source: ImageSource.camera));
              },
            ),
            TextButton(
              child: const Text('Galeri'),
              onPressed: () async {
                Navigator.of(context).pop(await picker.pickImage(source: ImageSource.gallery));
              },
            ),
          ],
        );
      },
    );

    if (selectedImage != null) {
      setState(() {
        _image = selectedImage; // Simpan gambar yang dipilih
      });
    }
  }

  void _submitReport() {
    if (_formKey.currentState!.validate()) {
      // Di sini Anda dapat menangani pengunggahan gambar jika diperlukan
      FirebaseService.addReport(
        _facilityController.text,
        _descriptionController.text,
        // _image?.path, // Kirim path gambar jika diperlukan
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
            onPressed: _pickImage,
            child: const Text('Pilih Gambar'),
          ),
          if (_image != null) 
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Image.file(File(_image!.path), height: 100), // Tampilkan gambar yang dipilih
            ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _submitReport,
            style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Mengatur warna latar belakang tombol
            foregroundColor: Colors.white, //atur warna teks menjadi putih
          ),
          child: const Text('Kirim'),
          ),
        ],
      ),
    );
  }
}
