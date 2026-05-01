import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/app_images.dart';
// TODO: Apne Tractor List page ka path yahan import karein
// import '../tractor_list/tractor_list_screen.dart'; 

class BrandSelectionScreen extends StatefulWidget {
  final String? categoryType; 

  const BrandSelectionScreen({super.key, this.categoryType});

  @override
  State<BrandSelectionScreen> createState() => _BrandSelectionScreenState();
}

class _BrandSelectionScreenState extends State<BrandSelectionScreen> {
  // Brand list data
  final List<Map<String, String>> brands = [
    {'name': 'Swaraj', 'image': AppImages.swaraj},
    {'name': 'Mahindra', 'image': AppImages.mahindra},
    {'name': 'John Deere', 'image': AppImages.johnDeere},
    {'name': 'Massey', 'image': AppImages.masseyFeguson},
    {'name': 'Eicher', 'image': AppImages.eicher},
    {'name': 'Sonalika', 'image': AppImages.sonalika},
    {'name': 'Kubota', 'image': AppImages.kabota},
    {'name': 'Farmtrac', 'image': AppImages.farmtrac},
    {'name': 'Powertrac', 'image': AppImages.powertrac},
    {'name': 'New Holland', 'image': AppImages.newHolland},
    {'name': 'Deutz Fahr', 'image': AppImages.deutzFahr},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.categoryType != null ? "Select ${widget.categoryType} Brand" : "Select Brand",
          style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: brands.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (context, index) {
          final brandName = brands[index]['name']!;
          final brandImage = brands[index]['image']!;

          return GestureDetector(
            onTap: () {
              // Click karte hi agle page par bhej rahe hain
              // Yahan 'TractorListScreen' ki jagah apne screen ka naam likhein
              print("Selected Brand: $brandName");
              
              /* 
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => YourTractorListScreen(
                    brandName: brandName, 
                    category: widget.categoryType
                  ),
                ),
              );
              */
              
              // Agar aapko sirf data wapis piche wale page par bhejna hai:
              Navigator.pop(context, brandName);
            },
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: Image.asset(
                          brandImage,
                          fit: BoxFit.contain,
                          errorBuilder: (c, e, s) => const Icon(Icons.agriculture, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  brandName,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}