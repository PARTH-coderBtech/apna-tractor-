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
    this.brand = "Mahindra",
    this.model = "Arjun 555",
    this.price = "7.50 Lakh",
    this.hp = "50 HP",
    this.imgPath = "lib/presentation/assets/images/tractors/tractor_banner.png", // Apna path yahan dalein
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // --- 1. Top Image Section (Premium App Bar Style) ---
          SliverAppBar(
            expandedHeight: 350,
            pinned: true,
            backgroundColor: AppColors.primaryTeal,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.8),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                imgPath,
                fit: BoxFit.cover, // Poori screen cover karega
              ),
            ),
          ),

          // --- 2. Details Content ---
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- Description Paragraph First ---
                  const Text(
                    "About this Tractor",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Ye tractor high-performance engine ke saath aata hai jo kheti ke bade kaamo ko asani se poora karta hai. Iska fuel consumption bahut kam hai aur maintenance ka kharcha bhi na ke barabar hai. Bharat ke kisanon ki pehli pasand jo har mausam mein saath nibhaye.",
                    style: TextStyle(fontSize: 15, color: Colors.black87, height: 1.6, letterSpacing: 0.3),
                  ),

                  const SizedBox(height: 30),
                  const Divider(),
                  const SizedBox(height: 20),

                  // --- Brand & Model (Premium Card Design) ---
                  Row(
                    children: [
                      _infoCard("Brand", brand, Icons.stars),
                      const SizedBox(width: 15),
                      _infoCard("Model", model, Icons.agriculture),
                    ],
                  ),
                  
                  const SizedBox(height: 15),

                  // --- Price Section ---
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.primaryTeal.withOpacity(0.1), Colors.white],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.primaryTeal.withOpacity(0.2)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("On-Road Price", style: TextStyle(color: Colors.grey, fontSize: 14)),
                        const SizedBox(height: 5),
                        Text(
                          "₹ $price onwards",
                          style: TextStyle(color: AppColors.primaryTeal, fontWeight: FontWeight.bold, fontSize: 26),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  const Text("Specifications", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),

                  // --- Key Specs Icons ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _specItem(Icons.bolt, hp, "Max Power"),
                      _specItem(Icons.settings, "3 Cyl", "Engine"),
                      _specItem(Icons.speed, "35 kmph", "Max Speed"),
                    ],
                  ),

                  const SizedBox(height: 120), // Padding for Bottom Button
                ],
              ),
            ),
          ),
        ],
      ),
      
      // --- Floating Bottom Button ---
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryTeal,
            minimumSize: const Size(double.infinity, 55),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          onPressed: () {},
          child: const Text(
            "CHECK ON-ROAD PRICE",
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  // Small Info Cards for Brand/Model
  Widget _infoCard(String label, String value, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 20, color: Colors.grey),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  // Spec Item Layout
  Widget _specItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primaryTeal.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.primaryTeal, size: 24),
        ),
        const SizedBox(height: 8),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}