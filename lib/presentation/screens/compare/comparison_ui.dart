import 'package:flutter/material.dart';
import 'comparison_item.dart';
import 'harvester_list.dart'; // Import path check karlein

class ComparisonUIScreen extends StatelessWidget {
  const ComparisonUIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Compare"), 
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Compare Harvesters", 
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 240, // Card ki height
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16),
                children: [
                  // Card 1: New Holland vs Swaraj
                  ComparisonItem(
                    title1: "New Holland", model1: "TC 5.30", price1: "Rs. 40.00 Lakh", 
                    image1: "assets/images/ac/compare1.jpeg",
                    title2: "Swaraj", model2: "8200", price2: "Rs. 30.00 Lakh", 
                    image2: "assets/images/ac/compare2.jpeg",
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const HarvesterListPage(
                        title1: "New Holland", model1: "TC 5.30", price1: "Rs. 40.00 Lakh", 
                        image1: "assets/images/ac/compare1.jpeg",
                        title2: "Swaraj", model2: "8200", price2: "Rs. 30.00 Lakh", 
                        image2: "assets/images/ac/compare2.jpeg",
                        engine1: "96 KW", engine2: "73.5 KW",
                        hp1: "130 HP", hp2: "101 HP",
                        cutter1: "15 Ft", cutter2: "14 Ft",
                        tank1: "3000 L", tank2: "3000 L",
                      ))),
                  ),
                  // Card 2: Kartar vs Swaraj (Jaisa 16.png mein hai)
                  ComparisonItem(
                    title1: "Kartar", model1: "3500", price1: "Rs. 28.72 Lakh", 
                    image1: "assets/images/ac/compare3.jpeg",
                    title2: "Swaraj", model2: "8200", price2: "Rs. 30.00 Lakh", 
                    image2: "assets/images/ac/compare2.jpeg",
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const HarvesterListPage(
                        title1: "Kartar", model1: "3500", price1: "Rs. 28.72 Lakh", 
                        image1: "assets/images/ac/compare3.jpeg",
                        title2: "Swaraj", model2: "8200", price2: "Rs. 30.00 Lakh", 
                        image2: "assets/images/ac/compare2.jpeg",
                        engine1: "56 KW", engine2: "73.5 KW",
                        hp1: "76 HP", hp2: "101 HP",
                        cutter1: "10 Ft", cutter2: "14 Ft",
                        tank1: "1500 L", tank2: "3000 L",
                      ))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}