import 'package:flutter/material.dart';
import 'package:g7_comerce_app/core/theme/app_colors.dart';
import 'package:g7_comerce_app/core/theme/asset_resources.dart';
import 'package:g7_comerce_app/core/theme/textstyle.dart';
import 'package:g7_comerce_app/presentation/screens/home/product%20view.dart';

class Chargerlistscreen extends StatelessWidget {
  Chargerlistscreen({super.key});

  final List<Map<String, dynamic>> products = [
    {"id": 1, "image": AssetResources.charger},
    {"id": 2, "image": AssetResources.charger},
    {"id": 3, "image": AssetResources.charger},
    {"id": 4, "image": AssetResources.charger},
    {"id": 5, "image": AssetResources.charger},
    {"id": 6, "image": AssetResources.charger},
    {"id": 7, "image": AssetResources.charger},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: AppColors.black),
        title: Text("Chargers", style: AppTextstyle.large()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            // Search row
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    height: 45,
                    decoration: BoxDecoration(
                      color: AppColors.lighteGrey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Colors.grey),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text("Search products",
                              style: AppTextstyle.small(fontColor: Colors.grey)),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: AppColors.lighteGrey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.tune, size: 22),
                ),
              ],
            ),
            const SizedBox(height: 15),

            // Product List
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final item = products[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductViewPage(productId: item['id']),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(item["image"]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Fast Charger",
                                    style: AppTextstyle.medium()),
                                const SizedBox(height: 5),
                                Text("₹ 29,999",
                                    style: AppTextstyle.large(
                                        fontWeight: FontWeight.w600)),
                                const SizedBox(height: 5),
                                Container(
                                  height: 33,
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Icon(Icons.shopping_bag_outlined,
                                          size: 18, color: Colors.green),
                                      SizedBox(width: 6),
                                      Text("Add Cart",
                                          style: TextStyle(color: Colors.green)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.favorite_border, size: 22),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
