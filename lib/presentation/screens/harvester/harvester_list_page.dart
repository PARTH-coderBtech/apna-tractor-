import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import 'harvester_detail_page.dart'; // Ensure this file exists

class HarvesterListPage extends StatefulWidget {
  const HarvesterListPage({super.key});

  @override
  State<HarvesterListPage> createState() => _HarvesterListPageState();
}

class _HarvesterListPageState extends State<HarvesterListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "All Harvesters",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Harvester Promo Banner
            _buildHarvesterBanner(),

            // 2. Swaraj Harvesters Section
            _buildSectionHeader("Swaraj Harvesters"),
            _buildRectangleHarvesterCard("Swaraj", "8200", "30.00 Lakh", "100 HP", "assets/swaraj_harvester.png"),
            _buildRectangleHarvesterCard("Swaraj", "8100 EX", "28.50 Lakh", "95 HP", "assets/swaraj_8100.png"),

            const SizedBox(height: 10),

            // 3. New Holland Harvesters Section
            _buildSectionHeader("New Holland Harvesters"),
            _buildRectangleHarvesterCard("New Holland", "TC 5.30 AC", "40.00 Lakh", "130 HP", "assets/nh_tc530.png"),
            _buildRectangleHarvesterCard("New Holland", "FR 480", "90.00 Lakh", "476 HP", "assets/nh_fr480.png"),

            const SizedBox(height: 20),

            // 4. Explore by Brand Grid
            _buildSectionHeader("Explore by Brand"),
            _buildBrandGrid(),
            
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Clickable Card with Navigation Logic
  Widget _buildRectangleHarvesterCard(String brand, String model, String price, String hp, String imgPath) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HarvesterDetailPage(
              brand: brand,
              model: model,
              price: price,
              hp: hp,
              imgPath: imgPath,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5)),
          ],
        ),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 120,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.grain, size: 50, color: Colors.grey),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(color: AppColors.primaryTeal, borderRadius: BorderRadius.circular(4)),
                    child: Text(hp, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(brand, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                  Text(model, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text("Rs. $price onwards", style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  const Text("On-Road Price, Bulandshahar", style: TextStyle(color: Colors.grey, fontSize: 11)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildHarvesterBanner() {
    return Container(
      margin: const EdgeInsets.all(16),
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        color: AppColors.accentCream,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black26),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("EXPLORE LATEST", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                const Text("Launch Harvester", style: TextStyle(fontSize: 12)),
                const SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryTeal, shape: const StadiumBorder()),
                  onPressed: () {},
                  child: const Text("VIEW DETAILS", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          const Positioned(right: 10, bottom: 10, child: Icon(Icons.grain, size: 80, color: Colors.black12)),
        ],
      ),
    );
  }

  Widget _buildBrandGrid() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            childAspectRatio: 0.9,
            children: [
              _brandItem("Swaraj"),
              _brandItem("New Holland"),
              _brandItem("John Deere"),
              _brandItem("Kartar"),
              _brandItem("Preet"),
              _brandItem("Vishal"),
              _brandItem("Dasmesh"),
              _brandItem("Standard"),
            ],
          ),
          const Divider(height: 1),
          TextButton(
            onPressed: () {},
            child: const Text("View all brands", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _brandItem(String name) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade100)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.business, size: 28, color: AppColors.primaryTeal),
          const SizedBox(height: 5),
          Text(name, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w500), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}