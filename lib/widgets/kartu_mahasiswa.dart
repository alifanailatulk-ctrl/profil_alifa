
import 'package:flutter/material.dart';
import '../models/mahasiswa.dart';

class KartuMahasiswa extends StatelessWidget {
  final Mahasiswa mahasiswa;
  final VoidCallback onTap;

  const KartuMahasiswa({
    super.key,
    required this.mahasiswa,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.indigo,
          child: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
        title: Text(
          mahasiswa.nama,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text('NIM: ${mahasiswa.nim}'),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),
        onTap: onTap,
      ),
    );
  }
}
