
import 'package:flutter/material.dart';
import '../models/mahasiswa.dart';

class TambahMahasiswaPage extends StatefulWidget {
  const TambahMahasiswaPage({super.key});

  @override
  State<TambahMahasiswaPage> createState() =>
      _TambahMahasiswaPageState();
}

class _TambahMahasiswaPageState
    extends State<TambahMahasiswaPage> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nimController =
      TextEditingController();

  final TextEditingController namaController =
      TextEditingController();

  final TextEditingController prodiController =
      TextEditingController();

  final TextEditingController emailController =
      TextEditingController();

  @override
  void dispose() {
    nimController.dispose();
    namaController.dispose();
    prodiController.dispose();
    emailController.dispose();

    super.dispose();
  }

  void simpanData() {
    if (_formKey.currentState!.validate()) {
      final mahasiswa = Mahasiswa(
        nim: nimController.text.trim(),
        nama: namaController.text.trim(),
        programStudi: prodiController.text.trim(),
        email:emailController.text.trim()
      );

      Navigator.pop(context, mahasiswa);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Mahasiswa'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child: ListView(
            children: [

              const Text(
                'Form Data Mahasiswa',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: nimController,
                decoration: const InputDecoration(
                  labelText: 'NIM',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.badge),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'NIM wajib diisi';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Mahasiswa',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama wajib diisi';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: prodiController,
                decoration: const InputDecoration(
                  labelText: 'Program Studi',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.school),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Program studi wajib diisi';
                  }
                  return null;
                },
              ),


               const SizedBox(height: 16),

               TextFormField(
                controller: emailController,
  keyboardType: TextInputType.emailAddress,
  decoration: const InputDecoration(
    labelText: 'Email',
    hintText: 'Masukkan email mahasiswa',
    prefixIcon: Icon(Icons.email),
    border: OutlineInputBorder(),
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Email wajib diisi';
    }

    if (!value.contains('@')) {
      return 'Masukkan email yang valid';
    }

    return null;
  },
),


              const SizedBox(height: 25),

              ElevatedButton.icon(
                onPressed: simpanData,
                icon: const Icon(Icons.save),
                label: const Text('Simpan Data'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(15),
                ),
              ),

              const SizedBox(height: 10),

              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Batal'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
