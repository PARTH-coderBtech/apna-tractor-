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
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // --- 1. Top Image Section (Premium Zoom Effect) ---
          SliverAppBar(
            expandedHeight: 380,
            pinned: true,
            backgroundColor: AppColors.primaryTeal,
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
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: model, // Smooth transition ke liye
                child: Image.asset(
                  imgPath,
                  fit: BoxFit.cover,
                  // Placeholder agar image load na ho
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.agriculture, size: 100, color: Colors.grey),
                  ),
                ),
              ),
            ),
          ),

          // --- 2. Details Content ---
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(25),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Subtitle
                  Text(
                    brand.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.primaryTeal,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    model,
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  
                  const SizedBox(height: 20),

                  // Description Paragraph (Top Priority)
                  const Text(
                    "Overview",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Ye modern harvester fasal ki katai ke liye sabse behtareen technology se लैस hai. Iska powerful engine aur wide cutter bar bade khet ko kam samay mein saaf kar deta hai. Isse na sirf anaj ki bachat hoti hai balki katai ki quality bhi premium milti hai.",
                    style: TextStyle(fontSize: 15, color: Colors.black54, height: 1.6),
                  ),

                  const SizedBox(height: 30),
                  const Divider(),
                  const SizedBox(height: 25),

                  // Premium Specification Grid
                  const Text(
                    "Key Specifications",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _specBox(Icons.settings_input_component, "Engine", hp),
                      _specBox(Icons.width_full, "Cutter Bar", "14 Feet"),
                      _specBox(Icons.local_gas_station, "Fuel Tank", "200 Ltr"),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Price Highlight Card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.red.shade100),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Starting Price", style: TextStyle(color: Colors.red, fontSize: 13, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 5),
                        Text(
                          "₹ $price onwards",
                          style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        const Text("*Ex-Showroom Price", style: TextStyle(color: Colors.grey, fontSize: 11)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 120), // For bottom spacing
                ],
              ),
            ),
          ),
        ],
      ),
      
      // --- 3. Bottom Action Button ---
      bottomSheet: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryTeal,
            minimumSize: const Size(double.infinity, 55),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 5,
            shadowColor: AppColors.primaryTeal.withOpacity(0.3),
          ),
          onPressed: () {},
          child: const Text(
            "BOOK FREE DEMO",
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1),
          ),
        ),
      ),
    );
  }

  // Helper widget for Spec Icons
  Widget _specBox(IconData icon, String title, String value) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade100),
          ),
          child: Icon(icon, color: AppColors.primaryTeal, size: 28),
        ),
        const SizedBox(height: 10),
        Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }
}