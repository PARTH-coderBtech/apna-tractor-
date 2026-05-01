import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class ComparisonItem extends StatelessWidget {
  final String title1, title2, model1, model2, price1, price2, image1, image2;
  final VoidCallback onTap;

  const ComparisonItem({
    super.key,
    required this.title1, required this.title2,
    required this.model1, required this.model2,
    required this.price1, required this.price2,
    required this.image1, required this.image2,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 310,
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          children: [
            Row(
              children: [
                _buildProduct(image1, title1, model1, price1),
                _vsDivider(),
                _buildProduct(image2, title2, model2, price2),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryTeal),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(
                child: Text("Compare Harvesters", 
                  style: TextStyle(color: AppColors.primaryTeal, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _vsDivider() {
    return Column(
      children: [
        Container(height: 35, width: 1, color: Colors.grey.shade300),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.grey.shade300)),
          child: const Text("VS", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
        ),
        Container(height: 35, width: 1, color: Colors.grey.shade300),
      ],
    );
  }

  Widget _buildProduct(String img, String brand, String model, String price) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(img, height: 75, fit: BoxFit.contain),
          Text(brand, style: const TextStyle(fontSize: 13, color: Colors.grey)),
          Text(model, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          Text(price, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const Text("Onwards", style: TextStyle(fontSize: 10, color: Colors.grey)),
        ],
      ),
    );
  }
}