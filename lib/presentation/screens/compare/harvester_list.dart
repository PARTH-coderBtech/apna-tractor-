import 'package:flutter/material.dart';
import 'comparison_item.dart'; // Import path check karlein

class HarvesterListPage extends StatelessWidget {
  // Constructor to receive dynamic data
  final String title1, title2, model1, model2, price1, price2, image1, image2;
  final String engine1, engine2, hp1, hp2, cutter1, cutter2, tank1, tank2;

  const HarvesterListPage({
    super.key,
    required this.title1, required this.title2,
    required this.model1, required this.model2,
    required this.price1, required this.price2,
    required this.image1, required this.image2,
    required this.engine1, required this.engine2,
    required this.hp1, required this.hp2,
    required this.cutter1, required this.cutter2,
    required this.tank1, required this.tank2,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Compare Tractors", // Jaisa screenshot 16.png mein hai
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Comparison Card (Wahi data dikhayega jo click kiya gaya)[cite: 1]
            ComparisonItem(
              title1: title1, model1: model1, price1: price1, image1: image1,
              title2: title2, model2: model2, price2: price2, image2: image2,
              onTap: () {}, // Detail page ke andar click action band rakhein
            ),
            
            const SizedBox(height: 25),

            // Specifications Sections (Box Style as per 16.png)[cite: 1]
            _buildSpecSection("Engine", engine1, engine2),
            _buildSpecSection("HP", hp1, hp2),
            _buildSpecSection("Cutter Bar", cutter1, cutter2),
            _buildSpecSection("Grain Tank", tank1, tank2),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Section builder for specs side-by-side[cite: 1]
  Widget _buildSpecSection(String title, String val1, String val2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 10),
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(val1, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                ),
              ),
              Container(width: 1, color: Colors.grey.shade300), // Middle line
              Expanded(
                child: Center(
                  child: Text(val2, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}