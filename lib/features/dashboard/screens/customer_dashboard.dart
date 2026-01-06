import 'package:flutter/material.dart';
import 'package:g7_comerce_app/core/theme/app_colors.dart';
import 'package:g7_comerce_app/core/theme/asset_resources.dart';
import 'package:g7_comerce_app/core/theme/textstyle.dart';
import 'package:g7_comerce_app/features/dashboard/screens/all_product.dart';

class CustomerDashboard extends StatelessWidget {
  CustomerDashboard({super.key});

  final List<Map<String, dynamic>> gridItems = [
    {'status': 'Accepted', 'image': AssetResources.accepted, 'count': '28'},
    {'status': 'Billed', 'image': AssetResources.billed, 'count': '13'},
    {'status': 'Processing', 'image': AssetResources.processing, 'count': '17'},
    {'status': 'Packed', 'image': AssetResources.packed, 'count': '23'},
    {'status': 'Dispatched', 'image': AssetResources.dispatched, 'count': '54'},
    {'status': 'Delivered', 'image': AssetResources.delivered, 'count': '34'},
  ];

  @override
  Widget build(BuildContext context) {
    Widget devider = SizedBox(height: 10);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Order Dashboard',style: AppTextstyle.medium(),),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // SizedBox(height: 20),
            devider,
            Container(
              height: 135,
              width: 380,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  transform: GradientRotation(10),
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.purple, AppColors.lightpink],
                  stops: [0.010, 1.000],
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ordered',
                            style: AppTextstyle.large(
                              fontColor: AppColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '(Pending)',
                            style: AppTextstyle.small(
                              fontColor: AppColors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: AppColors.white,
                        child: Center(
                          child: Image.asset(
                            AssetResources.pending,
                            height: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '54',
                      style: AppTextstyle.large(
                        fontSize: 29,
                        fontColor: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            devider,
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllProduct()),
                );
              },
              child: Container(
                height: 56,
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: BoxBorder.all(
                    color: AppColors.lighteGrey,
                    width: 0.5,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'All Product',
                      style: AppTextstyle.small(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '236',
                      style: AppTextstyle.large(
                        fontSize: 22,
                        fontColor: AppColors.pink,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            devider,
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.5,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  final item = gridItems[index];
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      height: MediaQuery.of(context).size.height * 3,
                      // width: 184,
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: AppColors.lighteGrey,
                          width: 0.5,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['status'],
                                style: AppTextstyle.small(
                                  fontColor: AppColors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Image.asset(item['image'], height: 40),
                            ],
                          ),
                          Text(item['count'], style: AppTextstyle.large()),
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
