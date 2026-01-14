

import 'package:flutter/material.dart';
import 'package:g7_comerce_app/core/theme/app_colors.dart';
import 'package:g7_comerce_app/core/theme/asset_resources.dart';
import 'package:g7_comerce_app/core/theme/textstyle.dart';
import 'package:g7_comerce_app/presentation/screens/category/chargerlist.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});

  final List<Map<String, dynamic>> categoryList = [
    {'image': AssetResources.chargerb, 'text': 'Charger'},
    {'image': AssetResources.backcovers, 'text': 'Back Covers'},
    {'image': AssetResources.screenguard, 'text': 'Screen Guards'},
    {'image': AssetResources.mobilestand, 'text': 'Mobile Stands'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      appBar: AppBar(
        title: Text('Category', style: AppTextstyle.large(fontSize: 20)),
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

              // child: TextField(
              //   decoration: InputDecoration(
              //     icon: Icon(Icons.search, size: 20, color: Colors.grey),
              //     hintText: 'Search categories',
              //     hintStyle: AppTextstyle.small(fontColor: Colors.grey),
              //     border: InputBorder.none,
              //   ),
              // ),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, size: 20, color: Colors.grey),
                  hintText: 'Search categories',
                  hintStyle: AppTextstyle.small(fontColor: AppColors.grey,   ),
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

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Chargerlistscreen(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.lighteGrey.withOpacity(0.6),
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(data['image'], height: 40),
                          const SizedBox(height: 6),

                          // Text(
                          //   data['text'],
                          //   style: AppTextstyle.small(
                          //     fontWeight: FontWeight.w600,
                          //     fontSize: 14,
                          //     fontColor: AppColors.black,
                          //   ),
                          // ),
                          Text(
                            data['text'],
                            style: AppTextstyle.small(
                               
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              fontColor: AppColors.black,
                            ),
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
