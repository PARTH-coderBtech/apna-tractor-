import 'package:flutter/material.dart';
import 'ac_cabin_screen_detail.dart'; // Niche wali file ka path yahan dein

class AcCabinScreen extends StatelessWidget {
  const AcCabinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ye aapka data hai jo image 13.png ke hisab se hai
    final List<Map<String, dynamic>> tractors = [
      {
        'imageUrl': 'lib/presentation/assets/images/ac/1.jpeg', // Apni image ka path badlein
        'brand': 'John deere',
        'model': '5130M 4wd',
        'hp': 130,
        'cc': 4500,
        'price': '70.00 Lakh',
        'rating': '4.5',
      },
      {
        'imageUrl': 'lib/presentation/assets/images/ac/2.jpeg',
        'brand': 'New Holland',
        'model': '105 HV 4WD',
        'hp': 106,
        'cc': 3387,
        'price': '35.00 Lakh',
        'rating': '4.5',
      },
      {
        'imageUrl': 'lib/presentation/assets/images/ac/3.jpeg',
        'brand': 'Sonalika',
        'model': '90 rx 4WD',
        'hp': 90,
        'cc': 4087,
        'price': '15.00 Lakh',
        'rating': '4.5',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F8),
      appBar: AppBar(
        title: const Text("AC Cabin Tractors", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: tractors.length,
        itemBuilder: (context, index) {
          final item = tractors[index];
          return _buildTractorCard(context, item);
        },
      ),
    );
  }

  Widget _buildTractorCard(BuildContext context, Map<String, dynamic> item) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 15),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                // Image Section
                Container(
                  width: 110,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(item['imageUrl']), fit: BoxFit.contain),
                  ),
                ),
                const SizedBox(width: 15),
                // Info Section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['brand'], style: const TextStyle(color: Colors.grey, fontSize: 13)),
                      Text(item['model'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.flash_on, size: 14, color: Colors.black54),
                          Text(" ${item['hp']} HP  ", style: const TextStyle(fontSize: 12)),
                          const Icon(Icons.settings, size: 14, color: Colors.black54),
                          Text(" ${item['cc']} CC", style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text("Rs. ${item['price']} onwards", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      const Text("On - Road Price, of your city", style: TextStyle(color: Colors.teal, fontSize: 11)),
                    ],
                  ),
                ),
                const Icon(Icons.favorite_border, color: Colors.grey),
              ],
            ),
          ),
          // Rating Badge
          Positioned(
            top: 0, right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: const BoxDecoration(
                color: Color(0xFF00796B),
                borderRadius: BorderRadius.only(topRight: Radius.circular(12), bottomLeft: Radius.circular(8)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.white, size: 12),
                  Text(" ${item['rating']}", style: const TextStyle(color: Colors.white, fontSize: 11)),
                ],
              ),
            ),
          ),
          // View Tractor Button
          Positioned(
            bottom: 10, left: 10,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AcCabinScreenDetail(tractorData: item)),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(color: const Color(0xFF00796B), borderRadius: BorderRadius.circular(20)),
                child: const Text("VIEW TRACTOR", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}