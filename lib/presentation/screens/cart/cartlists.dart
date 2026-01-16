import 'package:flutter/material.dart';
import 'package:g7_comerce_app/core/theme/app_colors.dart';
import 'package:g7_comerce_app/core/theme/asset_resources.dart';
import 'package:g7_comerce_app/core/theme/textstyle.dart';

class CartScreen extends StatelessWidget {
const  CartScreen({super.key});

  // final List<Map<String, dynamic>> items = [
  //   {"image": AssetResources.headphonee, "box": AssetResources.box},
  //   {"image": AssetResources.phonecase, "box": AssetResources.box},
  //   {"image": AssetResources.clrcharger, "box": AssetResources.box},
  //   {"image": AssetResources.chargerss, "box": AssetResources.box},
  //   {"image": AssetResources.Stands, "box": AssetResources.box},
  // ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
     
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            /// CART LIST
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (_, index) {
                  return Container(
                    // width: 380,
                    height: 154,
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.warmwhite,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.15),
                      ),
                    ),
                  


                   child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Image.asset(AssetResources.headset,scale: 9,)),
       
     
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Resource to descover and connect'),
                            Row(
                              children: [
                                Icon(Icons.currency_rupee_rounded),
                                Text('29,999')
                              ],
                            ),
                            Container(
                              height:46 ,
                              width: width/1.5,
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: AppColors.lytwhite,
                                borderRadius:BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      child: Text('Your resource to discover and connect with designers ', 
                                      style: AppTextstyle.small(fontWeight: FontWeight.w500,fontColor: AppColors.bluegrey,fontSize: 12),
                                      softWrap: true,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 25,
                                    width: 1,
                                    color: AppColors.backgroundwhite,
                                  ),
                                  SizedBox(width: 5,),
                                  Image.asset(AssetResources.boxcart ),
                                ],
                              ),
                            ),
                        
                             SizedBox(height: 6,),
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
                               SizedBox(width: 40),
                              Container(
                                height: 34,
                                width: 94,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.opacitypinkcolor, // button background
                                  
                                ),
                                
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Icon(
                                    //   Icons.shopping_bag_outlined,
                                    //   size: 18,
                                    //   color: AppColors.pink,
                                    // ),
                                    Image.asset(AssetResources.removebag,height: 13.56,width: 13.56,
                                    color: AppColors.pink,),
                                     const SizedBox(width: 6),
                                    Text(
                                      "Remove",
                                      style: AppTextstyle.small(fontWeight: FontWeight.w500,fontColor: AppColors.pink)
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                          ],
                        ),
                      )
                    ],
                   ),
                  );
                },
              ),
            ),

            /// TOTAL
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: AppTextstyle.large(fontWeight: FontWeight.w600),
                ),
                Text(
                  "₹ 8,59,999",
                  style: AppTextstyle.large(
                    fontWeight: FontWeight.w600,
                    fontColor: Colors.green,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

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
                  "Checkout",
                  style: AppTextstyle.medium(
                    fontColor: AppColors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 55),
          ],
        ),
      ),
    );
  }
}