import 'package:flutter/material.dart';
import 'package:g7_comerce_app/core/constant/app_colors.dart';
import 'package:g7_comerce_app/core/constant/asset_resources.dart';
import 'package:g7_comerce_app/core/constant/textstyle.dart';

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        
      ),
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
                    // child: Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     /// TOP → IMAGE + TITLE + PRICE
                    //     Row(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Container(
                    //           height: 70,
                    //           width: 70,
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(8),
                    //             image: DecorationImage(
                    //               image: AssetImage(items[index]["image"]),
                    //               fit: BoxFit.cover,
                    //             ),
                    //           ),
                    //         ),
                    //         const SizedBox(width: 10),
                    //         Expanded(
                    //           child: Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Text(
                    //                 "Resource to discover and connect",
                    //                 maxLines: 1,
                    //                 overflow: TextOverflow.ellipsis,
                    //                 style: AppTextstyle.medium(),
                    //               ),
                    //               const SizedBox(height: 4),
                    //               Text(
                    //                 "₹ 29,999",
                    //                 style: AppTextstyle.large(
                    //                   fontWeight: FontWeight.w700,
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ],
                    //     ),

                    //     const SizedBox(height: 8),

                    //     /// DESCRIPTION BOX
                    //     Container(
                    //       height: 38,
                    //       padding: const EdgeInsets.symmetric(horizontal: 10),
                    //       decoration: BoxDecoration(
                    //         color: const Color(0xffF3F3F6),
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       child: Row(
                    //         children: [
                    //           Expanded(
                    //             child: Text(
                    //               "Your resource to discover and connect with designers",
                    //               maxLines: 1,
                    //               overflow: TextOverflow.ellipsis,
                    //               style: AppTextstyle.small(),
                    //             ),
                    //           ),
                    //           VerticalDivider(
                    //             thickness: 1,
                    //             color: Colors.grey.withOpacity(0.4),
                    //           ),
                    //           Container(
                    //             height: 26,
                    //             width: 26,
                    //             decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(6),
                    //               image: DecorationImage(
                    //                 image: AssetImage(items[index]["box"]),
                    //                 fit: BoxFit.cover,
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),

                    //     const Spacer(),

                    //     /// BOTTOM → QTY + REMOVE
                    //     Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Container(
                    //           height: 34,
                    //           padding: const EdgeInsets.symmetric(horizontal: 10),
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(20),
                    //             border: Border.all(
                    //               color: Colors.grey.withOpacity(.4),
                    //             ),
                    //           ),
                    //           child: Row(
                    //             children: const [
                    //               Icon(Icons.remove, size: 16),
                    //               SizedBox(width: 8),
                    //               Text("01"),
                    //               SizedBox(width: 8),
                    //               Icon(Icons.add, size: 16),
                    //             ],
                    //           ),
                    //         ),
                    //         Container(
                    //           height: 34,
                    //           padding: const EdgeInsets.symmetric(horizontal: 14),
                    //           decoration: BoxDecoration(
                    //             color: const Color(0xffFFE8ED),
                    //             borderRadius: BorderRadius.circular(20),
                    //           ),
                    //           child: Row(
                    //             children: [
                    //               const Icon(
                    //                 Icons.delete_outline,
                    //                 size: 16,
                    //                 color: Colors.pink,
                    //               ),
                    //               const SizedBox(width: 4),
                    //               Text(
                    //                 "Remove",
                    //                 style: AppTextstyle.small(
                    //                   fontColor: Colors.pink,
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),



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
                                  Image.asset(AssetResources.boxCart, )
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
                                    Icon(
                                      Icons.shopping_bag_outlined,
                                      size: 18,
                                      color: AppColors.pink,
                                    ),
                                    // Image.asset(AssetResources.redbag,height: 13.56,width: 13.56,
                                    // color: AppColors.pink,),
                                    //  const SizedBox(width: 6),
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