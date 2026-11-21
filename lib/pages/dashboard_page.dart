
import 'package:flutter/material.dart';

import '../models/mahasiswa.dart';
import '../widgets/kartu_mahasiswa.dart';
import 'tambah_mahasiswa_page.dart';
import 'detail_mahasiswa_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  final List<Mahasiswa> daftarMahasiswa = [];

  // Fungsi untuk menambah mahasiswa
  Future<void> tambahMahasiswa() async {
    final hasil = await Navigator.push<Mahasiswa>(
      context,
      MaterialPageRoute(
        builder: (context) => const TambahMahasiswaPage(),
      ),
    );

    if (!mounted) return;

    if (hasil != null) {
      setState(() {
        daftarMahasiswa.add(hasil);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${hasil.nama} berhasil ditambahkan!',
          ),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  // Fungsi untuk membuka halaman detail
  void bukaDetail(Mahasiswa mahasiswa) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailMahasiswaPage(
          mahasiswa: mahasiswa,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Mahasiswa'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: Column(
        children: [

          // Informasi jumlah mahasiswa
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.indigo.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.groups,
                  size: 40,
                  color: Colors.indigo,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Jumlah Mahasiswa',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '${daftarMahasiswa.length}',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ],
            ),
          ),

          // Judul daftar mahasiswa
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Daftar Mahasiswa',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Daftar mahasiswa
          Expanded(
            child: daftarMahasiswa.isEmpty
                ? const Center(
                    child: Text(
                      'Belum ada data mahasiswa.\nSilakan tambahkan data baru.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                : ListView.builder(
                    itemCount: daftarMahasiswa.length,
                    itemBuilder: (context, index) {
                      final mahasiswa = daftarMahasiswa[index];

                      return KartuMahasiswa(
                        mahasiswa: mahasiswa,
                        onTap: () => bukaDetail(mahasiswa),
                      );
                    },
                  ),
          ),
        ],
      ),

      // Tombol tambah mahasiswa
      floatingActionButton: FloatingActionButton.extended(
        onPressed: tambahMahasiswa,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Tambah Mahasiswa'),
      ),
    );
  }
}
