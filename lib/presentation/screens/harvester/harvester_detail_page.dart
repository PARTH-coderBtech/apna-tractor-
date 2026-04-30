import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class HarvesterDetailPage extends StatelessWidget {
  final String brand;
  final String model;
  final String price;
  final String hp;
  final String imgPath;

  const HarvesterDetailPage({
    super.key,
    required this.brand,
    required this.model,
    required this.price,
    required this.hp,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text("$brand $model", style: const TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Harvester Image Section
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.grey.shade50,
              child: const Icon(Icons.grain, size: 150, color: Colors.grey),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(brand, style: const TextStyle(fontSize: 18, color: AppColors.primaryTeal, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(model, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Text("Rs. $price onwards", style: const TextStyle(fontSize: 22, color: Colors.red, fontWeight: FontWeight.w900)),
                  const SizedBox(height: 5),
                  const Text("On-Road Price, Bulandshahar", style: TextStyle(color: Colors.grey)),
                  
                  const Divider(height: 40),

                  const Text("Specifications", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _specTile(Icons.bolt, "Power", hp),
                      _specTile(Icons.grass, "Cutter Bar", "14 Feet"),
                      _specTile(Icons.settings, "Type", "Self Propelled"),
                    ],
                  ),
                  const SizedBox(height: 100), 
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)]
        ),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryTeal,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {},
                child: const Text("ENQUIRE NOW", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _specTile(IconData icon, String label, String value) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: AppColors.primaryTeal.withOpacity(0.1), shape: BoxShape.circle),
          child: Icon(icon, color: AppColors.primaryTeal),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }
}