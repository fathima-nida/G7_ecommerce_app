// import 'package:flutter/material.dart';
// import 'package:g7_comerce_app/core/constant/app_colors.dart';
// import 'package:g7_comerce_app/core/constant/asset_resources.dart';

// class ProductPage extends StatelessWidget {
//   final List<Map<String, String>> products = [
//     {
//       "title": "Resource to discover and connect",
//       "price": "₹29,999",
//       "image": AssetResources.charger,
//     },
//     {
//       "title": "Resource to discover and connect",
//       "price": "₹29,999",
//       "image": AssetResources.headset,
//     },
//     {
//       "title": "Resource to discover and connect",
//       "price": "₹29,999",
//       "image": AssetResources.phone,
//     },
//     {
//       "title": "Resource to discover and connect",
//       "price": "₹29,999",
//       "image": AssetResources.phonestand,
//     },
//     {
//       "title": "Resource to discover and connect",
//       "price": "₹29,999",
//       "image": AssetResources.screencard,
//     },
//   ];

//   ProductPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Products"), centerTitle: true),

//       body: ListView.builder(
//         itemCount: products.length,
//         itemBuilder: (context, index) {
//           return ProductCard(
//             title: products[index]["title"]!,
//             price: products[index]["price"]!,
//             image: products[index]["image"]!,
//           );
//         },
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: 3,
//         selectedItemColor: AppColors.pink,
//         unselectedItemColor: AppColors.grey,
//         type: BottomNavigationBarType.fixed,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
//           BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: ""),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_bag_outlined),
//             label: "",
//           ),
//           BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
//         ],
//       ),
//     );
//   }
// }

// class ProductCard extends StatelessWidget {
//   final String title;
//   final String price;
//   final String image;

//   const ProductCard({
//     super.key,
//     required this.title,
//     required this.price,
//     required this.image,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.all(10),
//       elevation: 2,
//       child: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Row(
//           children: [
//             Image.asset(image, height: 60, width: 60, fit: BoxFit.cover),

//             const SizedBox(width: 10),

//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 5),
//                   Text(price),
//                   const SizedBox(height: 8),

//                   Row(
//                     children: [
//                       Container(
//                         height: 34,
//                         width: 34,
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.grey),
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         // child: IconButton(
//                         //   icon: const Icon(Icons.remove),
//                         //   onPressed: () {},
//                         // ),
//                         child: InkWell(onTap: () {}, child: Icon(Icons.remove)),
//                       ),

//                       const SizedBox(width: 12),

//                       const Text(
//                         "04",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),

//                       const SizedBox(width: 12),

//                       Container(
//                         height: 34,
//                         width: 34,
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.grey),
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: InkWell(onTap: () {}, child: Icon(Icons.add)),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               height: 34,
//               width: 104,
//               decoration: BoxDecoration(
//                  borderRadius: BorderRadius.circular(10),
//                 color: AppColors.opacitygreenColor, // button background
//                 // borderRadius: BorderRadius.circular(16),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   Icon(
//                     Icons.shopping_bag_outlined,
//                     size: 18,
//                     color: AppColors.greenlight,
//                   ),
//                   SizedBox(width: 6),
//                   Text(
//                     "Add Cart",
//                     style: TextStyle(
//                       color: AppColors.greenlight,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
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
