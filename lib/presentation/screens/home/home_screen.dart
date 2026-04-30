import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/app_images.dart';
import 'widgets/custom_drawer.dart';
import 'widgets/category_card.dart';

// Screens for Navigation
import '../tractor/tractor_list_page.dart';
import '../harvester/harvester_list_page.dart';
import '../implement/implement_page.dart'; 
import 'common/budget_filter_screen.dart'; 
import 'common/hp_filter_screen.dart'; 
import 'common/brand_selection_screen.dart'; 
import 'common/ac_cabin_screen.dart'; 

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black, size: 30),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: const Row(
          children: [
            Icon(Icons.agriculture, color: AppColors.primaryTeal, size: 28),
            SizedBox(width: 8),
            Text('ApnaTractor', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSearchBar(),
                  const SizedBox(height: 20),
                  const Text("Filter", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  _buildFilterList(context), 
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  _buildPromoBanner(context),
                  const SizedBox(height: 30),
                  const Text("Explore Items!", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 25),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryCard(
                        title: "Tractor", 
                        icon: Icons.agriculture, 
                        nextScreen: const TractorDetailPage(), 
                      ),
                      CategoryCard(
                        title: "Harvester", 
                        icon: Icons.grain, 
                        nextScreen: const HarvesterListPage(),
                      ),
                      CategoryCard(
                        title: "Implement", 
                        icon: Icons.settings_input_component, 
                        nextScreen: const ImplementPage(),
                      ),
                      const CategoryCard(
                        title: "Equipment", 
                        icon: Icons.build,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.navGrey,
        selectedItemColor: AppColors.primaryTeal,
        unselectedItemColor: AppColors.primaryTeal.withOpacity(0.6),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: "NEWS"),
          BottomNavigationBarItem(icon: Icon(Icons.play_circle), label: "VIDEOS"),
          BottomNavigationBarItem(icon: Icon(Icons.compare_arrows), label: "COMPARE"),
          BottomNavigationBarItem(icon: Icon(Icons.agriculture), label: "TESTING"),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search Awesome....',
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 15, top: 12),
          suffixIcon: Icon(Icons.search, color: Colors.black, size: 28),
        ),
      ),
    );
  }

  Widget _buildFilterList(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _filterItem(context, "Budget", Icons.account_balance_wallet, const BudgetFilterScreen()),
          _filterItem(context, "Brand", Icons.branding_watermark, const BrandSelectionScreen(categoryType: 'Tractor')),
          _filterItem(context, "Hp", Icons.settings, const HpFilterScreen()),
          _filterItem(context, "Ac cabin", Icons.agriculture, const AcCabinScreen()),
        ],
      ),
    );
  }

  Widget _filterItem(BuildContext context, String label, IconData icon, Widget targetScreen) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => targetScreen)),
      child: _filterChip(label, icon),
    );
  }

  Widget _filterChip(String label, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: AppColors.primaryTeal,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(7), bottomLeft: Radius.circular(7)),
            ),
            child: Icon(icon, color: Colors.white, size: 18),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoBanner(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const BrandSelectionScreen(categoryType: 'Tractor')));
      },
      child: Container(
        width: double.infinity,
        height: 180,
        decoration: BoxDecoration(
          color: AppColors.accentCream,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black12),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("EXPLORE LATEST", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Colors.black87)),
                  const Text("Launch Tractor Brands", style: TextStyle(fontSize: 14, color: Colors.black54)),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryTeal, shape: const StadiumBorder()),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const BrandSelectionScreen(categoryType: 'Tractor')));
                    },
                    child: const Text("EXPLORE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Positioned(
              right: -10, bottom: 0,
              child: Image.asset(AppImages.tractorBanner, height: 170, fit: BoxFit.contain),
            ),
          ],
        ),
      ),
    );
  }
}