import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class TractorDetailPage extends StatelessWidget {
  final String brand;
  final String model;
  final String price;
  final String hp;
  final String imgPath;

  const TractorDetailPage({
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
      // Image ko status bar ke piche le jaane ke liye
      extendBodyBehindAppBar: true, 
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.9),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // --- Upper Half: Tractor Photo ---
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              // Jab real images ho tab AssetImage ya NetworkImage use karein
              // image: DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover),
            ),
            child: Hero(
              tag: model,
              child: Center(
                child: Icon(Icons.agriculture, size: 180, color: Colors.grey.shade400),
              ),
            ),
          ),

          // --- Lower Half: Details Section ---
          Expanded(
            child: Container(
              width: double.infinity,
               // Image ke just niche se start
              padding: const EdgeInsets.all(25.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -5))
                ],
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Brand & Model
                    Text(brand.toUpperCase(), 
                      style: const TextStyle(fontSize: 14, color: AppColors.primaryTeal, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                    const SizedBox(height: 5),
                    Text(model, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                    
                    const SizedBox(height: 15),
                    
                    // Price Tag
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "₹ $price onwards",
                        style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),

                    const SizedBox(height: 30),
                    const Text("Key Specifications", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),

                    // Specs Row (Horizontal)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _specCircle(Icons.bolt, "Power", hp),
                        _specCircle(Icons.settings, "Engine", "3 Cyl"),
                        _specCircle(Icons.speed, "Speed", "35 kmph"),
                      ],
                    ),

                    const SizedBox(height: 30),
                    const Divider(),
                    const SizedBox(height: 20),

                    const Text("Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    const Text(
                      "Ye tractor apni category mein sabse bharosemand aur taqatwar hai. Iska engine heavy tasks ke liye banaya gaya hai aur ye behtareen mileage deta hai. Kheti ke har kaam mein ye aapka sacha saathi hai.",
                      style: TextStyle(fontSize: 15, color: Colors.black54, height: 1.6),
                    ),
                    
                    const SizedBox(height: 100), // Bottom button ke liye extra space
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // Floating Bottom Button
      bottomSheet: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))],
        ),
        child: SizedBox(
          width: double.infinity,
          height: 55,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryTeal,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 0,
            ),
            onPressed: () {},
            child: const Text(
              "GET ON-ROAD PRICE",
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  // Specifications ke liye Rounded Design
  Widget _specCircle(IconData icon, String label, String value) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: AppColors.primaryTeal.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.primaryTeal, size: 28),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }
}