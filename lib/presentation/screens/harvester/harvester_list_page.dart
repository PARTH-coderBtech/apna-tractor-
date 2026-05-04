import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import 'harvester_detail_page.dart';

class HarvesterListPage extends StatelessWidget {
  final String? brandName;

  // 🔥 NEW: multi-filter support
  final Map<String, dynamic>? filters;

  HarvesterListPage({super.key, this.brandName, this.filters});

  final List<Map<String, String>> harvesters = [
    {
      "brand": "Swaraj",
      "model": "8200 2wd",
      "price": "30.00 Lakh",
      "hp": "101 HP",
      "img": "assets/images/harvestors/Swaraj8200.jpeg",
    },
    {
      "brand": "New Holland",
      "model": "TC 5.30 AC Cabin",
      "price": "40.00 Lakh",
      "hp": "130 HP",
      "img": "assets/images/harvestors/NewHolland5.30.jpeg",
    },
    {
      "brand": "Mahindra",
      "model": "H12 4wd",
      "price": "14.00 Lakh",
      "hp": "65 HP",
      "img": "assets/images/harvestors/MahindraH12.jpeg",
    },
    {
      "brand": "John Deere",
      "model": "W70",
      "price": "30.00 Lakh",
      "hp": "100 HP",
      "img": "assets/images/harvestors/Johndeere.jpeg",
    },
    {
      "brand": "Preet",
      "model": "987",
      "price": "35.00 Lakh",
      "hp": "101 HP",
      "img": "assets/images/harvestors/Preet.jpeg",
    },
    {
      "brand": "Kartar",
      "model": "3500",
      "price": "28.72 Lakh",
      "hp": "76 HP",
      "img": "assets/images/harvestors/Kartar.jpeg",
    },
    {
      "brand": "Sonalika",
      "model": "9614",
      "price": "24.00 Lakh",
      "hp": "101 HP",
      "img": "assets/images/harvestors/Sonalika.jpeg",
    },
    {
      "brand": "Kubota",
      "model": "DC 68 G HK",
      "price": "28.00 Lakh",
      "hp": "68 HP",
      "img": "assets/images/harvestors/Kubota.jpeg",
    },
    {
      "brand": "Vishal",
      "model": "328 Leal",
      "price": "25.00 Lakh",
      "hp": "101 HP",
      "img": "assets/images/harvestors/Vishal.jpeg",
    },
  ];

  // ================= FILTER LOGIC =================

   List<Map<String, String>> getFilteredList() {
    List<Map<String, String>> list = harvesters;

    if (filters == null && brandName == null) return list;

    if (filters?["brand"] != null) {
      list =
          list.where((h) => h["brand"] == filters!["brand"]).toList();
    } else if (brandName != null) {
      list = list.where((h) => h["brand"] == brandName).toList();
    }

    if (filters?["minHp"] != null &&
        filters?["maxHp"] != null) {
      list = list.where((h) {
        int hp = int.parse(
            h["hp"]!.replaceAll(RegExp(r'[^0-9]'), ''));
        return hp >= filters!["minHp"] &&
            hp <= filters!["maxHp"];
      }).toList();
    }

    if (filters?["minBudget"] != null &&
        filters?["maxBudget"] != null) {
      list = list.where((h) {
        double price = double.parse(
            h["price"]!.replaceAll(RegExp(r'[^0-9.]'), ''));
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
          brandName != null
              ? "$brandName Harvesters"
              : "Harvesters",
        ),
      ),

      // EMPTY
      body: list.isEmpty
          ? const Center(child: Text("No harvesters found"))

          // LIST
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
                        builder: (_) => HarvesterDetailPage(
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
                    margin:
                        const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(16),
                      border: Border.all(
                          color: Colors.grey.shade300),
                    ),

                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            // IMAGE
                            Image.asset(
                              item["img"]!,
                              height: 90,
                              width: 110,
                              fit: BoxFit.contain,
                              errorBuilder:
                                  (context, error, stackTrace) {
                                return const Icon(
                                    Icons.image_not_supported);
                              },
                            ),

                            const SizedBox(width: 10),

                            // TEXT
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item["brand"]!,
                                    style: const TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),

                                  Text(
                                    item["model"]!,
                                    style:
                                        const TextStyle(
                                      fontSize: 22,
                                      fontWeight:
                                          FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 6),

                                  Row(
                                    children: [
                                      const Icon(
                                          Icons.flash_on,
                                          size: 16),
                                      const SizedBox(
                                          width: 4),
                                      Text(item["hp"]!),

                                      const SizedBox(
                                          width: 15),
                                    ],
                                  ),

                                  const SizedBox(
                                      height: 10),

                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              "Rs. ${item["price"]} ",
                                          style:
                                              const TextStyle(
                                            fontSize: 18,
                                            fontWeight:
                                                FontWeight
                                                    .bold,
                                            color:
                                                Colors.black,
                                          ),
                                        ),
                                        const TextSpan(
                                          text: "onwards",
                                          style: TextStyle(
                                              color:
                                                  Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const Text(
                                    "On - Road Price, of your city",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),

                            // RIGHT SIDE
                            Column(
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets
                                          .symmetric(
                                          horizontal: 6,
                                          vertical: 2),
                                  decoration:
                                      BoxDecoration(
                                    color: AppColors
                                        .primaryTeal,
                                    borderRadius:
                                        BorderRadius
                                            .circular(6),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.star,
                                          color:
                                              Colors.white,
                                          size: 12),
                                      SizedBox(width: 2),
                                      Text("4.5",
                                          style: TextStyle(
                                              color: Colors
                                                  .white,
                                              fontSize:
                                                  12)),
                                    ],
                                  ),
                                ),

                                const SizedBox(
                                    height: 25),

                                const Icon(Icons
                                    .favorite_border),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        // BUTTON
                        Align(
                          alignment:
                              Alignment.centerLeft,
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 8),
                            decoration: BoxDecoration(
                              color: AppColors
                                  .primaryTeal,
                              borderRadius:
                                  BorderRadius.circular(
                                      20),
                            ),
                            child: const Text(
                              "VIEW HARVESTER",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight:
                                    FontWeight.bold,
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