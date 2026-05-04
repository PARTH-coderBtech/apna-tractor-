import 'package:apna_tractor/presentation/screens/implement/implement_list_page.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/app_images.dart';

import '../../tractor/tractor_list_page.dart';
import '../../harvester/harvester_list_page.dart';

class BrandSelectionScreen extends StatefulWidget {
  const BrandSelectionScreen({super.key});

  @override
  State<BrandSelectionScreen> createState() => _BrandSelectionScreenState();
}

class _BrandSelectionScreenState extends State<BrandSelectionScreen> {
  final List<Map<String, String>> brands = [
    {'name': 'Swaraj', 'image': AppImages.swaraj},
    {'name': 'Mahindra', 'image': AppImages.mahindra},
    {'name': 'John Deere', 'image': AppImages.johnDeere},
    {'name': 'Massey Ferguson', 'image': AppImages.masseyFeguson},
    {'name': 'Eicher', 'image': AppImages.eicher},
    {'name': 'Deutz Fahr', 'image': AppImages.deutzFahr},
    {'name': 'Farm Trac', 'image': AppImages.farmtrac},
    {'name': 'Kubota', 'image': AppImages.kabota},
    {'name': 'New Holland', 'image': AppImages.newHolland},
    {'name': 'Power Trac', 'image': AppImages.powertrac},
    {'name': 'Sonalika', 'image': AppImages.sonalika},
    {'name': 'Ace', 'image': AppImages.ace},
  ];
final List<Map<String, String>> harvesterBrands = [
  {'name': 'Swaraj', 'image': AppImages.swaraj},
  {'name': 'Mahindra', 'image': AppImages.mahindra},
  {'name': 'John Deere', 'image': AppImages.johnDeere},
  {'name': 'Sonalika', 'image': AppImages.sonalika},  
  {'name': 'Kubota', 'image': AppImages.kabota},
  {'name': 'Ace', 'image': AppImages.ace},
  {'name': 'New Holland', 'image': AppImages.newHolland},
  {'name': 'Preet', 'image': AppImages.preet},
  {'name': 'Claas', 'image': AppImages.claas},
  {'name': 'Kartar', 'image': AppImages.kartar},
  {'name': 'Malkit', 'image': AppImages.malkit},
  {'name': 'Vishal', 'image': AppImages.vishal},

];
final List<Map<String, String>> implementBrands = [
  {'name': 'Swaraj', 'image': AppImages.swaraj},
    {'name': 'Mahindra', 'image': AppImages.mahindra},
    {'name': 'John Deere', 'image': AppImages.johnDeere},
    {'name': 'Massey Ferguson', 'image': AppImages.masseyFeguson},
    {'name': 'Eicher', 'image': AppImages.eicher},
    {'name': 'Deutz Fahr', 'image': AppImages.deutzFahr},
    {'name': 'Farm Trac', 'image': AppImages.farmtrac},
    {'name': 'Kubota', 'image': AppImages.kabota},
    {'name': 'New Holland', 'image': AppImages.newHolland},
    {'name': 'Power Trac', 'image': AppImages.powertrac},
    {'name': 'Sonalika', 'image': AppImages.sonalika},
    {'name': 'Ace', 'image': AppImages.ace},
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,

      appBar: AppBar(
        title: const Text(
          "Select Brand",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: AppColors.backgroundWhite,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSection("Tractor Brands", "tractor"),
            const SizedBox(height: 25),

            _buildSection("Harvester Brands", "harvester"),
            const SizedBox(height: 25),

            _buildSection("Implement Brands", "implement"),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String type) {
  List<Map<String, String>> list = [];

  if (type == "tractor") {
    list = brands;
  } else if (type == "harvester") {
    list = harvesterBrands;
  } else if (type == "implement") {
    list = implementBrands;
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryTeal,
        ),
      ),

      const SizedBox(height: 12),

      GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: list.length, // ✅ FIX
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          final brand = list[index]; // ✅ FIX

          return GestureDetector(
            onTap: () => _onBrandSelected(type, brand['name']!),

            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      brand['image']!,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  brand['name']!,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ],
  );
}

  void _onBrandSelected(String type, String brandName) {
  if (type == "tractor") {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            TractorListPage(filters: {"brand": brandName}),
      ),
    );
  } else if (type == "harvester") {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            HarvesterListPage(filters: {"brand": brandName}),
      ),
    );
  } else if (type == "implement") { // ✅ FIX
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            ImplementListPage(filters: {"brand": brandName}),
      ),
    );
  }
}
}
