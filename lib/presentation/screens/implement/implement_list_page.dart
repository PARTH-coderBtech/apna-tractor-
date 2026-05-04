import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import 'implement_detail_page.dart';

class ImplementListPage extends StatelessWidget {
  final String? brandName;
  final Map<String, dynamic>? filters;

  const ImplementListPage({
    super.key,
    this.brandName,
    this.filters,
  });

  final List<Map<String, String>> implements = const [
    {
      "brand": "Swaraj",
      "model": "Straw Reaper",
      "price": "3.50 Lakh",
      "hp": "25 HP",
      "img": "assets/images/implements/StrawReaper.jpeg",
    },
    {
      "brand": "Swaraj",
      "model": "Potato Planter",
      "price": "5.40 Lakh",
      "hp": "60 HP",
      "img": "assets/images/implements/PotatoPlanter.jpeg",
    },
    {
      "brand": "Mahindra",
      "model": "Cultivator",
      "price": "0.25 Lakh",
      "hp": "60 HP",
      "img": "assets/images/implements/Cultivator.jpeg",
    },
    {
      "brand": "Mahindra",
      "model": "Rotavator",
      "price": "1.30 Lakh",
      "hp": "60 HP",
      "img": "assets/images/implements/Rotavator.jpeg",
    },
    {
      "brand": "John Deere",
      "model": "L331R Square Baler",
      "price": "15.00 Lakh",
      "hp": "110 HP",
      "img": "assets/images/implements/johndeere.jpeg",
    },
  ];

  // ================= SAME FILTER LOGIC =================

  List<Map<String, String>> getFilteredList() {
    List<Map<String, String>> list = implements;

    if (filters == null && brandName == null) return list;

    // 🔥 BRAND FILTER (same as tractor)
    if (filters?["brand"] != null) {
      list = list.where((i) => i["brand"] == filters!["brand"]).toList();
    } else if (brandName != null) {
      list = list.where((i) => i["brand"] == brandName).toList();
    }

    // 🔥 HP FILTER (same parsing)
    if (filters?["minHp"] != null && filters?["maxHp"] != null) {
      list = list.where((i) {
        int hp = int.parse(i["hp"]!.replaceAll(RegExp(r'[^0-9]'), ''));
        return hp >= filters!["minHp"] &&
            hp <= filters!["maxHp"];
      }).toList();
    }

    // 🔥 BUDGET FILTER (same parsing)
    if (filters?["minBudget"] != null &&
        filters?["maxBudget"] != null) {
      list = list.where((i) {
        double price = double.parse(
          i["price"]!.replaceAll(RegExp(r'[^0-9.]'), ''),
        );
        return price >= filters!["minBudget"] &&
            price <= filters!["maxBudget"];
      }).toList();
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    final list = getFilteredList();

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,

      appBar: AppBar(
        backgroundColor: AppColors.primaryTeal,
        foregroundColor: Colors.white,
        title: Text(
          brandName != null ? "$brandName Implements" : "Implements",
        ),
      ),

      body: list.isEmpty
          ? const Center(child: Text("No implements found"))

          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: list.length,
              itemBuilder: (context, index) {
                final item = list[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ImplementDetailPage(
                          brand: item["brand"]!,
                          model: item["model"]!,
                          price: item["price"]!,
                          hp: item["hp"]!,
                          imgPath: item["img"]!,
                        ),
                      ),
                    );
                  },

                  child: Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade300),
                    ),

                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // IMAGE
                            Image.asset(
                              item["img"]!,
                              height: 90,
                              width: 110,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.image_not_supported);
                              },
                            ),

                            const SizedBox(width: 10),

                            // TEXT
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item["brand"]!,
                                    style: const TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),

                                  Text(
                                    item["model"]!,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 6),

                                  Row(
                                    children: [
                                      const Icon(Icons.flash_on, size: 16),
                                      const SizedBox(width: 4),
                                      Text(item["hp"]!),
                                    ],
                                  ),

                                  const SizedBox(height: 10),

                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "₹ ${item["price"]} ",
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const TextSpan(
                                          text: "onwards",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const Text(
                                    "On - Road Price, of your city",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // RIGHT SIDE
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryTeal,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.star,
                                          color: Colors.white, size: 12),
                                      SizedBox(width: 2),
                                      Text("4.3",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12)),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 25),
                                const Icon(Icons.favorite_border),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        // BUTTON
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 8),
                            decoration: BoxDecoration(
                              color: AppColors.primaryTeal,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              "VIEW IMPLEMENT",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}