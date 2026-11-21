
import 'package:flutter/material.dart';

class BarisInfo extends StatelessWidget {
  final String label;
  final String nilai;

  const BarisInfo({
    super.key,
    required this.label,
    required this.nilai,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            nilai,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
