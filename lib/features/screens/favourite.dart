import 'package:flutter/material.dart';
import 'package:g7_comerce_app/core/theme/app_colors.dart';
import 'package:g7_comerce_app/core/theme/asset_resources.dart';
import 'package:g7_comerce_app/core/theme/textstyle.dart';
import 'package:g7_comerce_app/features/screens/favouriealert.dart';

class Favourite extends StatelessWidget {
  Favourite({super.key});

  Future<void> _openDescriptionSheet(BuildContext context) async {
    final result = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true, 
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const DescriptionBottomSheet(),
    );

    if (result != null && result.isNotEmpty) {
      debugPrint("User description: $result");

    }
  }


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
              height: 150,
              width: 300,
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
                                    border: Border.all(color: AppColors.grey),
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
                                    border: Border.all(color: AppColors.grey),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Icon(Icons.add),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 40),
                            InkWell(
                               onTap: () {
                               _openDescriptionSheet(context);
                               },
                              // onTap: () => _openDescriptionSheet(context),
                               borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: 34,
                                width: 104,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.opacitygreenColor,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AssetResources.bag,
                                      color: AppColors.greenlight,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      "Add Cart",
                                      style: AppTextstyle.small(
                                        fontColor: AppColors.greenlight,
                                        //fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
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
