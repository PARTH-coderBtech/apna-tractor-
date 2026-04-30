import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? nextScreen;

  const CategoryCard({
    super.key,
    required this.title,
    required this.icon,
    this.nextScreen,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (nextScreen != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => nextScreen!),
          );
        }
      },
      child: Container(
        width: 80,
        height: 90,
        decoration: BoxDecoration(
          color: AppColors.accentCream,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 35, color: AppColors.primaryTeal),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}