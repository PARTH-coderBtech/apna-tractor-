import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final String modelName;
  const ProductDetailScreen({super.key, required this.modelName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Machine Details")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.grey.shade200,
              child: const Icon(Icons.image, size: 100, color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(modelName, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  const Text("Estimated Price: ₹ 6.50 Lakh*", style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.w600)),
                  const Divider(height: 30),
                  const Text("Key Specifications", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  _buildDetailRow("Engine Power", "50 HP"),
                  _buildDetailRow("Cylinders", "3"),
                  _buildDetailRow("Clutch", "Dual Clutch"),
                  _buildDetailRow("Lifting Capacity", "1800 KG"),
                  _buildDetailRow("Warranty", "2 Years"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 16)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }
}