import 'package:flutter/material.dart';
import 'product_detail_screen.dart'; // Import Details Screen

class ModelListScreen extends StatelessWidget {
  final String brandName;
  const ModelListScreen({super.key, required this.brandName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$brandName Models"),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: 6, 
        itemBuilder: (context, index) {
          String modelTitle = "$brandName Model-${index + 1}";
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.settings_suggest, color: Colors.teal),
              title: Text(modelTitle, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text("50 HP • 4WD • Diesel"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(modelName: modelTitle),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}