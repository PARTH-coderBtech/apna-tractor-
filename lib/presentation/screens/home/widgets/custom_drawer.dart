import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../widgets/emi_calculator_page.dart'; // Apna sahi path check karein

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // Drawer Header with Branding
          Container(
            padding: const EdgeInsets.only(top: 60, bottom: 20, left: 20),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                const Icon(Icons.agriculture, color: AppColors.primaryTeal, size: 32),
                const SizedBox(width: 12),
                const Text(
                  "ApnaTractor",
                  style: TextStyle(
                    fontSize: 24, 
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),

          // Menu Items
          _drawerTile(
            context, 
            Icons.home_outlined, 
            "Home", 
            onTap: () => Navigator.pop(context),
          ),
          
          _drawerTile(
            context, 
            Icons.calculate_outlined, 
            "EMI Calculator", 
            onTap: () {
              Navigator.pop(context); // Drawer close
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EmiCalculatorPage()),
              );
            },
          ),

          _drawerTile(context, Icons.favorite_border, "Favourites"),
          _drawerTile(context, Icons.chat_bubble_outline, "Rate Us"),

          const Spacer(),

          // Bottom Section (Contact & Social)
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color(0xFFF9F5F0), // Light Cream Background
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Toll Free Number", 
                  style: TextStyle(fontSize: 12, color: Colors.grey, letterSpacing: 0.5),
                ),
                const SizedBox(height: 5),
                const Text(
                  "7351002972", 
                  style: TextStyle(
                    fontWeight: FontWeight.bold, 
                    color: AppColors.primaryTeal, 
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Connect with us!", 
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    _socialIcon(Icons.facebook),
                    const SizedBox(width: 20),
                    _socialIcon(Icons.play_circle_fill),
                    const SizedBox(width: 20),
                    _socialIcon(Icons.camera_alt),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Helper Widget for Drawer Tiles
  Widget _drawerTile(BuildContext context, IconData icon, String title, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87, size: 26),
      title: Text(
        title, 
        style: const TextStyle(
          fontSize: 16, 
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
      onTap: onTap ?? () {},
    );
  }

  // Helper Widget for Social Icons
  Widget _socialIcon(IconData icon) {
    return InkWell(
      onTap: () {
        // Social media links handle karein
      },
      child: Icon(icon, size: 26, color: Colors.black87),
    );
  }
}