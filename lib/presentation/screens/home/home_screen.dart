import 'package:apna_tractor/presentation/screens/implement/implement_list_page.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/app_images.dart';
import 'widgets/custom_drawer.dart';
import 'widgets/category_card.dart';

// Screens
import '../tractor/tractor_list_page.dart';
import '../harvester/harvester_list_page.dart';
import '../implement/implement_detail_page.dart';
import 'common/budget_filter_screen.dart';
import 'common/hp_filter_screen.dart';
import 'common/brand_selection_screen.dart';
import 'common/ac_cabin_screen.dart';
import '../compare/comparison_ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // ✅ ACTIVE FILTER STATE (NEW ADDITION ONLY)
  Map<String, dynamic> activeFilters = {};

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showResultChoice(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (_) {
      return Container(
        padding: const EdgeInsets.all(20),
        height: 220, // 🔥 thoda increase kiya
        child: Column(
          children: [
            const Text(
              "Apply Filter On",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                // ✅ TRACTOR
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            TractorListPage(filters: activeFilters),
                      ),
                    );
                  },
                  child: const Text("Tractor"),
                ),

                // ✅ HARVESTER
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            HarvesterListPage(filters: activeFilters),
                      ),
                    );
                  },
                  child: const Text("Harvester"),
                ),

                // 🔥 NEW: IMPLEMENT
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            ImplementListPage(filters: activeFilters),
                      ),
                    );
                  },
                  child: const Text("Implement"),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      _buildHomeBody(context),

      _simplePage("News Page Content Here"),
      _simplePage("Videos Page Content Here"),
      const ComparisonUIScreen(),
      _simplePage("Testing Page Content Here"),
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      drawer: const CustomDrawer(),

      appBar: _selectedIndex == 0
          ? AppBar(
              actions: [
                IconButton(
                  icon: const Icon(Icons.refresh, color: Colors.black),
                  onPressed: () {
                    setState(() {
                      activeFilters.clear(); // 🔥 RESET ALL FILTERS
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Filters cleared")),
                    );
                  },
                ),
              ],
              backgroundColor: AppColors.backgroundWhite,
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.black),

              leading: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu, size: 28),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),

              title: const Row(
                children: [
                  Icon(
                    Icons.agriculture,
                    color: AppColors.primaryTeal,
                    size: 26,
                  ),

                  SizedBox(width: 8),
                  Text(
                    'ApnaTractor',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          : null,

      body: pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: AppColors.navGrey,
        selectedItemColor: AppColors.primaryTeal,
        unselectedItemColor: AppColors.primaryTeal.withOpacity(0.6),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: "NEWS"),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle),
            label: "VIDEOS",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows),
            label: "COMPARE",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.agriculture),
            label: "TESTING",
          ),
        ],
      ),
    );
  }

  // ================= HOME BODY =================
  Widget _simplePage(String text) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryTeal,
              ),
            ),
            const SizedBox(height: 10),

            const Text(
              "Content will be available soon...",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
Widget _buildHomeBody(BuildContext context) {
  return LayoutBuilder(
    builder: (context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight, // 🔥 screen fill karega
          ),
          child: IntrinsicHeight( // 🔥 important
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // 🔹 TOP SECTION
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundWhite,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSearchBar(),
                      const SizedBox(height: 16),

                      const Text(
                        "Filter",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(height: 10),
                      _buildFilterList(context),
                    ],
                  ),
                ),

                // 🔹 CONTENT
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPromoBanner(context),

                      const SizedBox(height: 16),

                      const Text(
                        "Explore Items!",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(height: 12),

                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          CategoryCard(
                            title: "Tractor",
                            icon: Icons.agriculture,
                            nextScreen:
                                TractorListPage(filters: activeFilters),
                          ),
                          CategoryCard(
                            title: "Harvester",
                            icon: Icons.grain,
                            nextScreen:
                                HarvesterListPage(filters: activeFilters),
                          ),
                          CategoryCard(
                            title: "Implement",
                            icon: Icons.settings_input_component,
                            nextScreen: const ImplementListPage(),
                          ),
                          const CategoryCard(
                              title: "Equipment", icon: Icons.build),
                        ],
                      ),
                    ],
                  ),
                ),

                // 🔥 THIS IS THE KEY LINE
                const Spacer(), // bottom space push karega nicely
              ],
            ),
          ),
        ),
      );
    },
  );
}

  // ================= SEARCH =================

  Widget _buildSearchBar() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search tractors...',
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          suffixIcon: Icon(Icons.search, color: Colors.black54),
        ),
      ),
    );
  }

  // ================= FILTER =================

  Widget _buildFilterList(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _filterItem(
            context,
            "Budget",
            Icons.account_balance_wallet,
            const BudgetFilterScreen(),
          ),

          _filterItem(
            context,
            "Brand",
            Icons.branding_watermark,
            const BrandSelectionScreen(),
          ),

          _filterItem(context, "HP", Icons.settings, const HpFilterScreen()),

          _filterItem(
            context,
            "AC Cabin",
            Icons.ac_unit,
            const AcCabinScreen(),
          ),
        ],
      ),
    );
  }

  // 🔥 UPDATED FILTER ITEM (RETURN VALUE HANDLE)
  Widget _filterItem(
    BuildContext context,
    String label,
    IconData icon,
    Widget screen,
  ) {
    return GestureDetector(
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => screen),
        );

        if (result != null && result is Map) {
          setState(() {
            activeFilters = {
              ...activeFilters,
              ...Map<String, dynamic>.from(result),
            };
          });

          _showResultChoice(context);
        }
      },
      child: _filterChip(label, icon),
    );
  }

  Widget _filterChip(String label, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
        color: AppColors.backgroundWhite,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: AppColors.primaryTeal,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(7),
                bottomLeft: Radius.circular(7),
              ),
            ),
            child: Icon(icon, color: Colors.white, size: 18),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  // ================= PROMO =================

  Widget _buildPromoBanner(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const BrandSelectionScreen()),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.accentCream,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "EXPLORE LATEST",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    "Tractor Brands",
                    style: TextStyle(color: Colors.black54),
                  ),

                  const SizedBox(height: 12),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryTeal,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const BrandSelectionScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "EXPLORE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(flex: 4, child: Image.asset(AppImages.tractorBanner)),
          ],
        ),
      ),
    );
  }
}
