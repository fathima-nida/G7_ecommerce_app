// import 'package:flutter/material.dart';
// import 'package:g7_comerce_app/core/constant/app_colors.dart';
// import 'package:g7_comerce_app/core/constant/asset_resources.dart';
// import 'package:g7_comerce_app/core/constant/textstyle.dart';

// class Chargerlistscreen extends StatelessWidget {
//    Chargerlistscreen({super.key});
//    final List<Map<String, dynamic>> items=[
//     {"image":AssetResources.charger1},
//     {"image":AssetResources.charger2},
//     {"image":AssetResources.charger3},
//     { "image":AssetResources.charger4},
//     {"image":AssetResources.charger5},
//     {"image":AssetResources.charger6},
//     {"image":AssetResources.charger7},
//    ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
// appBar: AppBar(
//         backgroundColor: AppColors.white,
//         elevation: 0,
//         leading: Icon(Icons.arrow_back, color:AppColors.black),
//         centerTitle: false,
//         title: Text("Charges", style: AppTextstyle.large()),
//         actions: [
//           Icon(Icons.more_vert, color: Colors.black),
//           SizedBox(width: 15),
//         ],
//       ),

//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15),
//         child: Column(
//           children: [
//             /// SEARCH BAR
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 12),
//               height: 45,
//               decoration: BoxDecoration(
//                 color: AppColors.lighteGrey.withOpacity(0.3),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Row(
//                 children: [
//                   Icon(Icons.search, color: AppColors.black),
//                   SizedBox(width: 10),
//                   Expanded(
//                     child: Text(
//                       "Search products",
//                       style: AppTextstyle.small(fontColor: Colors.grey),
//                     ),
//                   ),
//                   Icon(Icons.tune, color: AppColors.black),
//                 ],
//               ),
//             ),
//             SizedBox(height: 15),

//             /// LIST VIEW
//             Expanded(
//               child: ListView.builder(
//                 itemCount: items.length,
//                 itemBuilder: (_, index) {

//                   return Container(
//                     margin: EdgeInsets.only(bottom: 12),
//                     padding: EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: AppColors.white,
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(
//                         color: Colors.grey.withOpacity(0.2),
//                       ),
//                     ),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [

//                         /// IMAGE
//                         Container(
//                           height: 70,
//                           width: 70,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             image: DecorationImage(
//                               image: AssetImage(items[index]["image"]),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 12),

//                         /// TEXT
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Resource to discover and connect",
//                                 style: AppTextstyle.medium(),
//                               ),
//                               SizedBox(height: 5),
//                               Text(
//                                 "₹ 29,999",
//                                 style: AppTextstyle.large(
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                               SizedBox(height: 5),

//                               /// ADD CART BUTTON
//                               Container(
//                                 height: 33,
//                                 padding: EdgeInsets.symmetric(horizontal: 12),
//                                 decoration: BoxDecoration(
//                                   color: Colors.green.withOpacity(0.1),
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     Icon(Icons.shopping_bag_outlined,
//                                         size: 18, color: Colors.green),
//                                     SizedBox(width: 6),
//                                     Text("Add Cart",
//                                         style: AppTextstyle.small(
//                                             fontColor: Colors.green)),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),

//                         /// FAVORITE ICON
//                         Icon(Icons.favorite_border, size: 22),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:g7_comerce_app/core/constant/app_colors.dart';
import 'package:g7_comerce_app/core/constant/asset_resources.dart';
import 'package:g7_comerce_app/core/constant/textstyle.dart';

class Chargerlistscreen extends StatelessWidget {
  Chargerlistscreen({super.key});

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: AppColors.black),
        centerTitle: false,
        title: Text("Charges", style: AppTextstyle.large()),
        actions: [
          SizedBox(width: 10),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [

            /// SEARCH + FILTER ROW
            Row(
              children: [
                /// SEARCH FIELD
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    height: 45,
                    decoration: BoxDecoration(
                      color: AppColors.lighteGrey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Search products",
                            style: AppTextstyle.small(fontColor: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(width: 10),

                /// FILTER ICON BOX
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: AppColors.lighteGrey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.tune, color: AppColors.black, size: 22),
                ),
              ],
            ),
            SizedBox(height: 15),

            /// LIST VIEW
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (_, index) {

                  return Container(
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        /// IMAGE
                        Image.asset(AssetResources.backcover),
                        SizedBox(width: 12),

                        /// TEXT
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Resource to discover and connect",
                                style: AppTextstyle.medium(),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "₹ 29,999",
                                style: AppTextstyle.large(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 5),

                              /// ADD CART BUTTON
                              Container(
                                height: 33,
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.shopping_bag_outlined,
                                        size: 18, color: Colors.green),
                                    SizedBox(width: 6),
                                    Text("Add Cart",
                                        style: AppTextstyle.small(
                                            fontColor: Colors.green)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// FAVORITE ICON
                        Icon(Icons.favorite_border, size: 22),
                      ],
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
