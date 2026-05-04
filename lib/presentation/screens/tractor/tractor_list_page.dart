import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import 'tractor_detail_page.dart';

class TractorListPage extends StatelessWidget {
  final String? brandName;

  // 🔥 NEW: filters added safely
  final Map<String, dynamic>? filters;

  const TractorListPage({
    super.key,
    this.brandName,
    this.filters,
  });

  final List<Map<String, String>> tractors = const [
    {
      "brand": "Mahindra",
      "model": "605 DI 4wd",
      "price": "10.01 Lakh",
      "hp": "55 HP",
      "img": "assets/images/tractors/Mahindra605DI4wd.jpeg",
    },
    {
      "brand": "Swaraj",
      "model": "744 2wd",
      "price": "7.37 Lakh",
      "hp": "50 HP",
      "img": "assets/images/tractors/Swaraj7442wd.jpeg",
    },
    {
      "brand": "Swaraj",
      "model": "969 4wd",
      "price": "10.50 Lakh",
      "hp": "66 HP",
      "img": "assets/images/tractors/Swaraj9694wd.jpeg",
    },
    {
      "brand": "Nova",
      "model": "605 DI 2wd",
      "price": "9 Lakh",
      "hp": "57 HP",
      "img": "assets/images/tractors/Nova605DI2wd.jpeg",
    },
    {
      "brand": "Swaraj",
      "model": "855 2wd",
      "price": "9.00 Lakh",
      "hp": "55 HP",
      "img": "assets/images/tractors/tractor_banner.png",
    },
    {
      "brand": "Mahindra",
      "model": "575 DI 2wd",
      "price": "6.50 Lakh",
      "hp": "47 HP",
      "img": "assets/images/tractors/Mahindra575.jpeg",
    },
    {
      "brand": "Mahindra",
      "model": "744 2wd",
      "price": "9.50 Lakh",
      "hp": "49 HP",
      "img": "assets/images/tractors/Mahindra744.jpeg",
    },
    {
      "brand": "John Deere",
      "model": "5050D 2wd",
      "price": "8.50 Lakh",
      "hp": "50 HP",
      "img": "assets/images/tractors/John Deere50502.jpeg",
    },
    {
      "brand": "John Deere",
      "model": "5050D 4wd",
      "price": "10.00 Lakh",
      "hp": "50 HP",
      "img": "assets/images/tractors/John Deere50504.jpeg",
    },
    {
      "brand": "Massey Ferguson",
      "model": "245 DI",
      "price": "7.35 Lakh",
      "hp": "50 HP",
      "img": "assets/images/tractors/Massey Ferguson245.jpeg",
    },
    {
      "brand": "Massey Ferguson",
      "model": "241 DI",
      "price": "6.90 Lakh",
      "hp": "42 HP",
      "img": "assets/images/tractors/MasseyFerguson241.jpeg",
    },
     {
      "brand": "Eicher",
      "model": "380",
      "price": "6 Lakh",
      "hp": "40 HP",
      "img": "assets/images/tractors/Eicher380.jpeg",
    },
     {
      "brand": "Eicher",
      "model": "333",
      "price": "5.50 Lakh",
      "hp": "36 HP",
      "img": "assets/images/tractors/Eicher333.jpeg",
    },
     {
      "brand": "Sonalika",
      "model": "DI 35",
      "price": "5.50 Lakh",
      "hp": "39 HP",
      "img": "assets/images/tractors/Sonalika35.jpeg",
    },
     {
      "brand": "Sonalika",
      "model": "DI 50 4wd",
      "price": "8.50 Lakh",
      "hp": "52 HP",
      "img": "assets/images/tractors/Sonalika50.jpeg",
    },
     {
      "brand": "Kubota",
      "model": "MU 4501",
      "price": "7.85 Lakh",
      "hp": "45 HP",
      "img": "assets/images/tractors/Kubota4501.jpeg",
    },
     {
      "brand": "Kubota",
      "model": "MU 5502",
      "price": "9.20 Lakh",
      "hp": "55 HP",
      "img": "assets/images/tractors/Kubota5502.jpeg",
    },
     {
      "brand": "Farm Trac",
      "model": "45 PowerMaxx",
      "price": "7.10 Lakh",
      "hp": "50 HP",
      "img": "assets/images/tractors/Farmtrac45.jpeg",
    },
     {
      "brand": "Farm Trac",
      "model": "60 PowerMaxx",
      "price": "7.60 Lakh",
      "hp": "55 HP",
      "img": "assets/images/tractors/Farmtrac60.jpeg",
    },
     {
      "brand": "Power Trac",
      "model": "PP 46 I",
      "price": "8.40 Lakh",
      "hp": "55 HP",
      "img": "assets/images/tractors/Powertrac46.jpeg",
    },
     {
      "brand": "Power Trac",
      "model": "Euro 50",
      "price": "7.80 Lakh",
      "hp": "50 HP",
      "img": "assets/images/tractors/Powertrac50.jpeg",
    },
     {
      "brand": "New Holland",
      "model": "3630 TX SE",
      "price": "8.80 Lakh",
      "hp": "50 HP",
      "img": "assets/images/tractors/NewHolland3630.jpeg",
    },
     {
      "brand": "New Holland",
      "model": "3230 NX",
      "price": "6.40 Lakh",
      "hp": "42 HP",
      "img": "assets/images/tractors/NewHolland3230.jpeg",
    },
    {
      "brand": "Deutz Fahr",
      "model": "Agrolux 50",
      "price": "8.10 Lakh",
      "hp": "50 HP",
      "img": "assets/images/tractors/Deutz Fahr50.jpeg",
    },
    {
      "brand": "Deutz Fahr",
      "model": "Agrolux 45",
      "price": "7.50 Lakh",
      "hp": "45 HP",
      "img": "assets/images/tractors/Deuts Fahr 45.jpeg",
    },
    {
      "brand": "Ace",
      "model": "DI 450 NG",
      "price": "6.40 Lakh",
      "hp": "45 HP",
      "img": "assets/images/tractors/Ace450.jpeg",
    },
    {
      "brand": "Ace",
      "model": "DI 550 NG",
      "price": "6.45 Lakh",
      "hp": "50 HP",
      "img": "assets/images/tractors/Ace550.jpeg",
    },
  ];

  // ================= FILTER LOGIC =================

 List<Map<String, String>> getFilteredList() {
    List<Map<String, String>> list = tractors;

    if (filters == null) return list;

    if (filters!["brand"] != null) {
      list =
          list.where((t) => t["brand"] == filters!["brand"]).toList();
    }

    if (filters!["minHp"] != null &&
        filters!["maxHp"] != null) {
      list = list.where((t) {
        int hp = int.parse(t["hp"]!.split(" ")[0]);
        return hp >= filters!["minHp"] &&
            hp <= filters!["maxHp"];
      }).toList();
    }

    if (filters!["minBudget"] != null &&
        filters!["maxBudget"] != null) {
      list = list.where((t) {
        double price =
            double.parse(t["price"]!.replaceAll(" Lakh", ""));
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
              ? "$brandName Tractors"
              : "Tractors",
        ),
      ),

      // ================= EMPTY =================
      body: list.isEmpty
          ? const Center(child: Text("No tractors found"))

          // ================= LIST =================
          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: list.length,
              itemBuilder: (context, index) {
                final tractor = list[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TractorDetailPage(
                          brand: tractor["brand"]!,
                          model: tractor["model"]!,
                          price: tractor["price"]!,
                          hp: tractor["hp"]!,
                          imgPath: tractor["img"]!,
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
                              tractor["img"]!,
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
                                    tractor["brand"]!,
                                    style: const TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),

                                  Text(
                                    tractor["model"]!,
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
                                      Text(
                                          tractor["hp"]!),

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
                                              "Rs. ${tractor["price"]} ",
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
                              "VIEW TRACTOR",
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