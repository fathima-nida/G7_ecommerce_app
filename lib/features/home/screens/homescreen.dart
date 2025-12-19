import 'package:flutter/material.dart';
import 'package:g7_comerce_app/core/constant/app_colors.dart';
import 'package:g7_comerce_app/core/constant/asset_resources.dart';
import 'package:g7_comerce_app/core/constant/textstyle.dart';
import 'package:g7_comerce_app/features/home/screens/widgets/carousal.dart';

class Homescreen extends StatefulWidget {

   Homescreen({super.key});
  final List<String> imagelist = [
  AssetResources.headset,
  AssetResources.backcover,
  AssetResources.screenguard,
  AssetResources.headset,
  AssetResources.backcover,
  AssetResources.screenguard,
  
  
];
final List<String> nameList = [
      "Headset",
      "Back Cover",
      "Screenguard",
      "Headset",
      "Back Cover",
      "Screenguard",
];
final List<String> ad=[
  AssetResources.ad1,
  AssetResources.ad1

];
final List<String>ad2=[
  AssetResources.ad2,
  AssetResources.ad2
];

  @override
  State<Homescreen> createState() => _HomescreenState();
}



class _HomescreenState extends State<Homescreen> {
   
  
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
               children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(AssetResources.profile),
                    ),
                    SizedBox(width: 5,),
                    Expanded(
                      child: Row(
                      children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ahmed Raza",
                                style: AppTextstyle.medium(fontSize: 15),
                              ),
                              Text(
                                "ahmedraza@gmail.com",
                                style: AppTextstyle.small(
                                  fontSize: 13,
                                  fontColor: AppColors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.lytwhite,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search_outlined,
                              size: 20,
                              color: AppColors.grey,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.lytwhite,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.notifications_outlined,
                              size: 20,
                              color: AppColors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.lytwhite,
                          backgroundImage: AssetImage(AssetResources.charger),
                          radius: 35,
                        ),
                        Text(
                          "Charges",
                          style: AppTextstyle.small(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 5),
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.lytwhite,
                          backgroundImage: AssetImage(AssetResources.mobilestand),
                          radius: 35,
                        ),
                        Text(
                          "Mobile Stands",
                          style: AppTextstyle.small(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 5),
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.lytwhite,
                          backgroundImage: AssetImage(AssetResources.headset),
                          radius: 35,
                        ),
                        Text(
                          "Headsets",
                          style: AppTextstyle.small(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 5),
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.lytwhite,
                          backgroundImage: AssetImage(
                            AssetResources.backcover,
                          ),
                          radius: 35,
                        ),
                        Text(
                          "Back Cover",
                          style: AppTextstyle.small(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 5),
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.lytwhite,
                          backgroundImage: AssetImage(
                            AssetResources.screenguard,
                          ),
                          radius: 35,
                        ),
                        Text(
                          "Screen Guards",
                          style: AppTextstyle.small(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 5),
                  ],
                ),
              ),
              SizedBox(height: 13),
              Carousal(image: widget.ad),
              SizedBox(height: 15),
              Text(
                "New Arrival",
                style: AppTextstyle.large(fontSize: 19),
              ),
              SizedBox(height: 15,),
              SizedBox(
                width: width,
                height: height/2.5,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:3,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 2,
                  childAspectRatio: 0.7
                  ),itemCount:widget.imagelist.length,
                  itemBuilder: (context,index){
                   return Container(
                    
                    color: AppColors.warmwhite,
                    height: 186,
                    width: 128,
                   child: Column(
                   mainAxisSize: MainAxisSize.min,
                     children: [
                       Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.favorite_border_outlined)),
                        Image.asset(widget.imagelist[index]),
                        Text(widget.nameList[index]),
                        Text("₹ 25,000",style: AppTextstyle.medium(fontWeight: FontWeight.w700),),
                         Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),color:index==2||index==5?AppColors.opacitypinkcolor: AppColors.Opacitygreencolor),
                         
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.shopping_bag_outlined,color:index==2||index==5?AppColors.pink: AppColors.green,size: 15,),
                              SizedBox(width: 5,),
                              Text(index==2||index==5?"Remove":"Add Cart",style: AppTextstyle.small(fontColor:index==2||index==5?AppColors.pink: AppColors.green,fontSize: 13),),
                            ],
                          ),
                         ),
                       )
                     ],
                   ),
                    
                   );
                  },
                ),
              ),
             SizedBox(height: 15,),
              Carousal(image: widget.ad2),
            SizedBox(height: 15,),
                Text(
                  "Offer Zone",
                  style: AppTextstyle.large(fontSize: 19),
                ),
                SizedBox(height: 15,),
               SizedBox(
                height: height/2.5,
                width: width,
                 child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                   padding: EdgeInsets.zero,
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount:3,
                     mainAxisSpacing: 1,
                     crossAxisSpacing: 2,
                  childAspectRatio: 0.7,
                   ),itemCount:widget.imagelist.length,
                   itemBuilder: (context,index){
                    return Container(
                     
                     color: AppColors.warmwhite,
                     height: 186,
                     width: 128,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                         alignment: Alignment.topRight,
                         child: Icon(Icons.favorite_border_outlined)),
                         Image.asset(widget.imagelist[index]),
                         Text(widget.nameList[index]),
                         Text("₹ 25,000",style: AppTextstyle.medium(fontWeight: FontWeight.w700),),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),color:index==2 || index==5?AppColors.opacitypinkcolor: AppColors.Opacitygreencolor,),
                          
                           child: Row(
                            mainAxisSize: MainAxisSize.min,
                             children: [
                               Icon(Icons.shopping_bag_outlined,color:index==2||index==5?AppColors.pink: AppColors.green,size: 15,),
                               SizedBox(width: 5,),
                               Text(index==2||index==5?"Remove":"Add Cart",style: AppTextstyle.small(fontColor:index==2||index==5?AppColors.pink: AppColors.green,fontSize: 13),),
                             ],
                           ),
                          ),
                        )
                      ],
                    ),
                     
                    );
                   },
                 ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}
