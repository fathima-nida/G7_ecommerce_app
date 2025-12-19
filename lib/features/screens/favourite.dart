

import 'package:flutter/material.dart';
import 'package:g7_comerce_app/core/constant/app_colors.dart';
import 'package:g7_comerce_app/core/constant/asset_resources.dart';
import 'package:g7_comerce_app/core/constant/textstyle.dart';

class Favourite extends StatelessWidget {
  Favourite({super.key});

  final List<Map<String, dynamic>> products = [
    {
      "title": "Resource to discover and connect",
      "price": "₹29,999",
      "image": AssetResources.charger,
    },
    {
      "title": "Resource to discover and connect",
      "price": "₹29,999",
      "image": AssetResources.headset,
    },
    {
      "title": "Resource to discover and connect",
      "price": "₹29,999",
      "image": AssetResources.phone,
    },
    {
      "title": "Resource to discover and connect",
      "price": "₹29,999",
      "image": AssetResources.phonestand,
    },
    {
      "title": "Resource to discover and connect",
      "price": "₹29,999",
      "image": AssetResources.screencard,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          final item = products[index % products.length];
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: AppColors.containercolor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    // height: 60,
                    //   width: 60,
                    child: Image.asset(item['image'], fit: BoxFit.cover),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item['title'],
                            style: AppTextstyle.small(
                              fontWeight: FontWeight.w500,
                              fontColor: AppColors.grey,
                            ),
                          ),
                          Icon(Icons.close, color: AppColors.pink),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        item['price'],
                        style: AppTextstyle.medium(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 8),

                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 34,
                                  width: 34,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  // child: IconButton(
                                  //   icon: const Icon(Icons.remove),
                                  //   onPressed: () {},
                                  // ),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Icon(Icons.remove),
                                  ),
                                ),
                                
                                const SizedBox(width: 12),
                                
                                Text(
                                  "04",
                                  style: AppTextstyle.small(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                
                                const SizedBox(width: 12),
                                
                                Container(
                                  height: 34,
                                  width: 34,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Icon(Icons.add),
                                  ),
                                ),
                              ],
                            ),
                            //  SizedBox(width: 40),
                            Container(
                              height: 34,
                              width: 104,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.opacitygreenColor, // button background
                                
                              ),
                              
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.shopping_bag_outlined,
                                    size: 18,
                                    color: AppColors.greenlight,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    "Add Cart",
                                    style: TextStyle(
                                      color: AppColors.greenlight,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
