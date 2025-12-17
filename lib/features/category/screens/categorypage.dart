// // import 'package:flutter/material.dart';
// // import 'package:g7_comerce_app/core/constant/app_colors.dart';
// // import 'package:g7_comerce_app/core/constant/asset_resources.dart';
// // import 'package:g7_comerce_app/core/constant/textstyle.dart';

// // // BEGINNER FRIENDLY CATEGORY SCREEN
// // // Uses ASSET IMAGES instead of icons

// // class CategoryScreen extends StatelessWidget {
// //   const CategoryScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: AppColors.white,

// //       // TOP APP BAR
// //       appBar: AppBar(
// //         title: Text(
// //           'Category',
// //           style: AppTextstyle.large(),
// //         ),
// //         centerTitle: true,
// //         backgroundColor: AppColors.white,
// //         elevation: 0,
// //         foregroundColor: AppColors.black,
// //       ),

// //       // MAIN BODY
// //       body: Padding(
// //         padding: const EdgeInsets.all(16),
// //         child: Column(
// //           children: [
// //             // SEARCH BAR
// //             Container(
// //               height: 45,
// //               padding: const EdgeInsets.symmetric(horizontal: 12),
// //               decoration: BoxDecoration(
// //                 color: AppColors.lighteGrey,
// //                 borderRadius: BorderRadius.circular(10),
// //               ),
// //               child:  TextField(
// //                 decoration: InputDecoration(
// //                   icon: Icon(Icons.search),
// //                   hintText: 'Search categories',
// //                   hintStyle: AppTextstyle.small(fontColor: AppColors.black),
// //                   border: InputBorder.none,
// //                 ),
// //               ),

// //              SizedBox(height: 20),

// //             // CATEGORY GRID
// //             Expanded(
// //               child: GridView.count(
// //                 crossAxisCount: 2, // 2 boxes in a row
// //                 crossAxisSpacing: 12,
// //                 mainAxisSpacing: 12,
// //                 childAspectRatio: 184 / 111, // exact ratio from design
// //                 children: const [
// //                   CategoryCard(
// //                     title: 'Charges',
// //                     imagePath: 'assets/images/charger.png',
// //                   ),
// //                   CategoryCard(
// //                     title: 'Back Covers',
// //                     imagePath: 'assets/images/backcover.png',
// //                   ),
// //                   CategoryCard(
// //                     title: 'Screen Guards',
// //                     imagePath: AssetResources.,
// //                   ),
// //                   CategoryCard(
// //                     title: 'Mobile Stands',
// //                     imagePath: 'assets/images/stand.png',
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             ),
// //           ],
// //         ),
// //       ),

// //       // BOTTOM NAV BAR

// //     );
// //   }
// // }

// // // SINGLE CATEGORY CARD WIDGET
// // class CategoryCard extends StatelessWidget {
// //   final String title;
// //   final String imagePath;

// //   const CategoryCard({
// //     super.key,
// //     required this.title,
// //     required this.imagePath,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       decoration: BoxDecoration(
// //         borderRadius: BorderRadius.circular(12),
// //         border: Border.all(color: AppColors.lighteGrey),
// //       ),
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Image.asset(
// //             imagePath,
// //             height: 40,
// //           ),
// //           const SizedBox(height: 8),
// //           Text(
// //             title,
// //             style: AppTextstyle.small(),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:g7_comerce_app/core/constant/app_colors.dart';
// import 'package:g7_comerce_app/core/constant/asset_resources.dart';
// import 'package:g7_comerce_app/core/constant/textstyle.dart';

// class Categorypage extends StatelessWidget {
//   Categorypage({super.key});

//   final List<Map<String, dynamic>> CategoryCard = [
//     {'image': AssetResources.charger, 'Text': 'Charges'},
//     {'image': AssetResources.backcover, 'Text': 'backcover'},
//     {'Image': AssetResources.screencard, 'Text': 'screen card'},
//     {'Image': AssetResources.stand, 'Text': 'Stand'},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           // SEARCH BAR
//           Container(
//             height: 45,
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             decoration: BoxDecoration(
//               color: AppColors.lighteGrey,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: TextField(
//               decoration: InputDecoration(
//                 icon: Icon(Icons.search),
//                 hintText: 'Search categories',
//                 hintStyle: AppTextstyle.small(fontColor: AppColors.black),
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//           SizedBox(height: 20),

//           Expanded(
//             child: GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//               ),
//               itemCount: 4,
//               itemBuilder: (context, index) {
//                 final item = CategoryCard[index];
//                 return Container(
//                   height: 111,
//                   width: 184,
//                   decoration: BoxDecoration(),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset(item['image'], height: 40),
//                       SizedBox(height: 8),
//                       Text(item['Text'], style: AppTextstyle.small()),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:g7_comerce_app/core/constant/app_colors.dart';
import 'package:g7_comerce_app/core/constant/asset_resources.dart';
import 'package:g7_comerce_app/core/constant/textstyle.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});

  final List<Map<String, dynamic>> categoryList = [
    {'image': AssetResources.charger, 'text': 'Charges'},
    {'image': AssetResources.backcover, 'text': 'Back Covers'},
    {'image': AssetResources.screencard, 'text': 'Screen Guards'},
    {'image': AssetResources.stand, 'text': 'Mobile Stands'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      appBar: AppBar(
        title: Text(
          'category',
          style: AppTextstyle.large(),
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
        foregroundColor: AppColors.black,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            
            // 🔍 SEARCH BAR
            Container(
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.lighteGrey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, size: 20, color: AppColors.black),
                  hintText: 'Search categories',
                  hintStyle: AppTextstyle.small(fontColor: AppColors.black),
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 📦 GRID VIEW
            Expanded(
              child: GridView.builder(
                itemCount: categoryList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 184 / 111,
                ),
                itemBuilder: (context, index) {
                  final data = categoryList[index];

                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lighteGrey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          data['image'],
                          height: 40,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          data['text'],
                          style: AppTextstyle.small(),
                        ),
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
