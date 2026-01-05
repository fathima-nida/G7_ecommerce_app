import 'package:flutter/material.dart';
import 'package:g7_comerce_app/core/theme/app_colors.dart';
import 'package:g7_comerce_app/core/theme/asset_resources.dart';
//import 'package:g7_comerce_app/core/constant/asset_resource.dart';
//import 'package:g7_comerce_app/core/constant/asset_resources.dart';
//import 'package:g7_comerce_app/core/constant/asset_resources.dart';
import 'package:g7_comerce_app/core/theme/textstyle.dart';

//search screen

class Searchscreen extends StatelessWidget {
  Searchscreen({super.key});

  final List<Map<String, dynamic>> items = [
    {"image": AssetResources.screencard},
    {"image": AssetResources.backcovers},
    {"image": AssetResources.charger1},
    {"image": AssetResources.headset},
    {"image": AssetResources.mobilestand},
    {"image": AssetResources.charger1},
    {"image": AssetResources.screenguard},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: AppColors.black),
        ),
        title: Text(
          "Search Product",
          style: AppTextstyle.medium(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// 🔍 Search Bar
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: AppColors.lytwhite,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: AppColors.grey),
                        const SizedBox(width: 8),
                        Text(
                          "Search Products",
                          style: AppTextstyle.small(fontColor: AppColors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: AppColors.lytwhite,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // child: const Icon(Icons.tune),
                  child: Center(
                    child: Image.asset(AssetResources.filter,
                    // width: 22,
                    // height: 22,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// 🛍 Product List
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.warmwhite,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Image
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              color: AppColors.warmwhite,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Image.asset(
                              items[index]["image"],
                              fit: BoxFit.contain,
                            ),
                          ),

                          const SizedBox(width: 12),

                          /// TEXT (STATIC)
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Resource to discover and connect",
                                  style: AppTextstyle.medium(
                                    fontColor: AppColors.grey,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "₹ 29,999",
                                  style: AppTextstyle.large(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 8),

                                /// ADD CART
                                Container(
                                  height: 33,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.green.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(AssetResources.bag,
                                      width: 18,
                                      height: 18,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        "Add Cart",
                                        style: AppTextstyle.small(
                                          fontColor: AppColors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// Favorite
                          Image.asset(AssetResources.favorite,
                          // width: 20,
                          // height: 20,
                          ),
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
