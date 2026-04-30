import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/app_images.dart';

class BrandSelectionScreen extends StatefulWidget {
  // ERROR FIX: Ye line add karna zaroori hai
  final String? categoryType; 

  // ERROR FIX: Constructor mein 'this.categoryType' hona chahiye
  const BrandSelectionScreen({super.key, this.categoryType});

  @override
  State<BrandSelectionScreen> createState() => _BrandSelectionScreenState();
}

class _BrandSelectionScreenState extends State<BrandSelectionScreen> {
  final Set<String> _selectedBrands = {};

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          // widget.categoryType ka use karke dynamic title
          widget.categoryType != null ? "Select ${widget.categoryType} Brands" : "Select Brands",
          style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          if (_selectedBrands.isNotEmpty)
            TextButton(
              onPressed: () => setState(() => _selectedBrands.clear()),
              child: const Text("Clear All", style: TextStyle(color: Colors.redAccent)),
            )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
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
                final isSelected = _selectedBrands.contains(brandName);

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        _selectedBrands.remove(brandName);
                      } else {
                        _selectedBrands.add(brandName);
                      }
                    });
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isSelected ? AppColors.primaryTeal : Colors.transparent,
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: isSelected 
                                    ? AppColors.primaryTeal.withOpacity(0.1) 
                                    : Colors.black.withOpacity(0.03),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              )
                            ],
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Center(
                                  child: Image.asset(
                                    brands[index]['image']!,
                                    fit: BoxFit.contain,
                                    errorBuilder: (c, e, s) => const Icon(Icons.agriculture, color: Colors.grey),
                                  ),
                                ),
                              ),
                              if (isSelected)
                                Positioned(
                                  top: 5,
                                  right: 5,
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: AppColors.primaryTeal,
                                    child: const Icon(Icons.check, size: 12, color: Colors.white),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        brandName,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                          color: isSelected ? AppColors.primaryTeal : Colors.black87,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          _buildApplyButton(),
        ],
      ),
    );
  }

  Widget _buildApplyButton() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))],
      ),
      child: ElevatedButton(
        onPressed: _selectedBrands.isEmpty 
            ? null 
            : () => Navigator.pop(context, _selectedBrands.toList()),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryTeal,
          minimumSize: const Size(double.infinity, 55),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
        child: Text(
          _selectedBrands.isEmpty 
              ? "Select a Brand" 
              : "Show ${_selectedBrands.length} Brands", 
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}