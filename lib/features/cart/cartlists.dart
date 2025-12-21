// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:g7_comerce_app/core/constant/app_colors.dart';
// import 'package:g7_comerce_app/core/constant/asset_resources.dart';
// import 'package:g7_comerce_app/core/constant/textstyle.dart';

// class Cartlistsscreen extends StatelessWidget {
//   Cartlistsscreen({super.key});
//   // final List<Map<String, dynamic>> products = [
//   //   {"image": AssetResources.charger1},
//   //   {"image": AssetResources.backcovers},
//   //   {"image": AssetResources.stand},
//   //   {"image": AssetResources.screenguard},
//   //   {"image": AssetResources.charger3},
//   // ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: AppColors.white,
//         leading: Icon(Icons.arrow_back, color: AppColors.black),
//         title: Text(
//           "Cart",
//           style: AppTextstyle.large(fontColor: AppColors.black),
//         ),
//         centerTitle: false,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
//         child: Column(
//           children: [
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
//                         color: AppColors.grey.withOpacity(0.2),
//                       ),
//                     ),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
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
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Resources to discover and connect",
//                                 style: AppTextstyle.medium(),
//                               ),
//                               SizedBox(height: 5),
//                               Text(
//                                 "29,999",
//                                 style: AppTextstyle.large(
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                               SizedBox(height: 10),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Container(
//                                     height: 33,
//                                     padding: EdgeInsets.symmetric(
//                                       horizontal: 12,
//                                     ),
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(22),
//                                       border: Border.all(
//                                         color: AppColors.grey.withOpacity(.4),
//                                       ),
//                                     ),
//                                     child: Row(
//                                       children: [
//                                         Icon(Icons.remove, size: 18),
//                                         SizedBox(width: 10),
//                                         Text("01"),
//                                         SizedBox(width: 10),
//                                         Icon(Icons.add, size: 18),
//                                       ],
//                                     ),
//                                   ),

//                                   ///remove
//                                   Row(
//                                     children: [
//                                       Icon(
//                                         Icons.delete_outline,
//                                         size: 18,
//                                         color: AppColors.pink,
//                                       ),
//                                       SizedBox(width: 5),
//                                       Text(
//                                         "Remove",
//                                         style: AppTextstyle.small(
//                                           fontColor: AppColors.pink,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
              
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("Total",style: AppTextstyle.large(fontWeight:FontWeight.w600),
//                 ),
//                 Text("8,59,999",style: AppTextstyle.large(
//                   fontWeight: FontWeight.w600,fontColor: AppColors.green
//                 ),),
//               ],
//             ),
//             SizedBox(height: 10),
//             Container(
//               height: 45,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: AppColors.pink,
//                 borderRadius: BorderRadius.circular(25),

//               ),
//               child: Center(
//                 child:Center(
//                  child: Text("checkout (0${items.length})"), 
                 
//                 ) ,
//               ),
//             )
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

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final List<Map<String, dynamic>> items = [
    {"image": AssetResources.headphone},
    {"image": AssetResources.backcover},
    {"image": AssetResources.charger7},
    {"image": AssetResources.screencard},
    {"image": AssetResources.stand},
    {"image": AssetResources.charger1},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: Icon(Icons.arrow_back, color: AppColors.black),
        title: Text("Cart", style: AppTextstyle.large(fontColor: AppColors.black)),
        centerTitle: false,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
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
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(items[index]["image"]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),

                        /// TEXT + PRICE + QTY + REMOVE
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
                                  fontWeight: FontWeight.w700,
                                ),
                              ),

                              SizedBox(height: 10),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  /// QTY BOX
                                  Container(
                                    height: 33,
                                    padding: EdgeInsets.symmetric(horizontal: 12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(22),
                                      border: Border.all(
                                          color: Colors.grey.withOpacity(.4)),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.remove, size: 18),
                                        SizedBox(width: 10),
                                        Text("01"),
                                        SizedBox(width: 10),
                                        Icon(Icons.add, size: 18),
                                      ],
                                    ),
                                  ),

                                  /// REMOVE
                                  Row(
                                    children: [
                                      Icon(Icons.delete_outline,
                                          size: 18, color: Colors.pink),
                                      SizedBox(width: 5),
                                      Text(
                                        "Remove",
                                        style: AppTextstyle.small(
                                            fontColor: Colors.pink),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            /// TOTAL ROW
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total",
                    style: AppTextstyle.large(fontWeight: FontWeight.w600)),
                Text(
                  "₹ 8,59,999",
                  style: AppTextstyle.large(
                      fontWeight: FontWeight.w600, fontColor: Colors.green),
                ),
              ],
            ),
            SizedBox(height: 10),

            /// CHECKOUT BUTTON
            Container(
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.pink,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  "Checkout (0${items.length})",
                  style: AppTextstyle.medium(fontColor: AppColors.white),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
