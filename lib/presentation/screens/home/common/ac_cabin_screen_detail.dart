import 'package:flutter/material.dart';

class AcCabinScreenDetail extends StatelessWidget {
  final Map<String, dynamic> tractorData;

  const AcCabinScreenDetail({super.key, required this.tractorData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // AppBar fix: 'app_bar' ko 'appBar' kar diya hai
      appBar: AppBar(
        title: const Text(
          "ApnaTractor",
          style: TextStyle(color: Color(0xFF00796B), fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Image Section - Image 14 structure
            const SizedBox(height: 10),
            Center(
              child: Image.asset(
                tractorData['imageUrl'],
                height: 250,
                fit: BoxFit.contain,
              ),
            ),
            const Divider(),
            
            // Title & Price Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${tractorData['brand']} ${tractorData['model']} HVAC 4 WD",
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Rs. ${tractorData['price']}",
                    style: const TextStyle(
                        fontSize: 18, 
                        fontWeight: FontWeight.bold, 
                        color: Colors.black),
                  ),
                  const Text(
                    "On - Road Price, of your city",
                    style: TextStyle(color: Colors.teal, fontSize: 12),
                  ),
                ],
              ),
            ),

            // Key Specifications Grid
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Key Specifications",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            _buildSpecGrid(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Specifications Grid (Table format as seen in Image 14)
  Widget _buildSpecGrid() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          _specRow("HP", "${tractorData['hp']} HP", "Engine", "${tractorData['cc']} CC"),
          const Divider(height: 1),
          _specRow("Lifting Capacity", "3700 Kg", "Clutch", "Perma"),
          const Divider(height: 1),
          _specRow("Cylinder", "4", "Warranty", "5 Yrs"),
          const Divider(height: 1),
          _specRow("Gear Box", "32F + 16R", "Steering", "Power Steering"),
          const Divider(height: 1),
          _specRow("Brake", "Hydraulic", "Fuel Tank", "165 L"),
        ],
      ),
    );
  }

  Widget _specRow(String label1, String val1, String label2, String val2) {
    return Row(
      children: [
        _specItem(label1, val1),
        Container(width: 1, height: 65, color: Colors.grey.shade300), // Vertical Divider
        _specItem(label2, val2),
      ],
    );
  }

  Widget _specItem(String label, String value) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 6),
            Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}