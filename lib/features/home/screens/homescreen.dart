import 'package:flutter/material.dart';
import 'package:g7_comerce_app/core/constant/app_colors.dart';
import 'package:g7_comerce_app/core/constant/asset_resources.dart';
import 'package:g7_comerce_app/core/constant/textstyle.dart';

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
      "Screenfuard",
      "Headset",
      "Back Cover",
      "Screenfuard",
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(AssetResources.profile),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
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
                    ),
                    SizedBox(width: 70),
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
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.warmgrey,
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
                          backgroundColor: AppColors.warmgrey,
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
                          backgroundColor: AppColors.warmgrey,
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
                          backgroundColor: AppColors.warmgrey,
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
                          backgroundColor: AppColors.warmgrey,
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
              SizedBox(height: 10),
              Image.asset(AssetResources.ad1),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 270),
                child: Text(
                  "New Arrival",
                  style: AppTextstyle.large(fontSize: 18),
                ),
              ),
              SizedBox(
                width: width,
                height: height/2.5,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:3,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 2
                  ),itemCount:widget.imagelist.length,
                  itemBuilder: (context,index){
                   return Container(
                    
                    color: AppColors.warmwhite,
                    height: 186,
                    width: 128,
                   child: Column(
                     children: [
                       Align(
                        alignment: AlignmentGeometry.topRight,
                        child: Icon(Icons.favorite_border_outlined)),
                        Image.asset(widget.imagelist[index]),
                        Text(widget.nameList[index]),
                        Text("₹ 25,000")
                     ],
                   ),
                    
                   );
                  },
                ),
              ),
              SizedBox(height: 5,),
              Image.asset(AssetResources.ad2),
              SizedBox(height: 15,),
                Padding(
                padding: const EdgeInsets.only(right: 270),
                child: Text(
                  "Offer Zone",
                  style: AppTextstyle.large(fontSize: 18),
                ),
              ),
               SizedBox(
                width: width,
                height: height/2.5,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:3,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 2
                  ),itemCount:widget.imagelist.length,
                  itemBuilder: (context,index){
                   return Container(
                    
                    color: AppColors.warmwhite,
                    height: 186,
                    width: 128,
                   child: Column(
                     children: [
                       Align(
                        alignment: AlignmentGeometry.topRight,
                        child: Icon(Icons.favorite_border_outlined)),
                        Expanded(child: Image.asset(widget.imagelist[index])),
                        Text(widget.nameList[index]),
                        Text("₹ 25,000",style: AppTextstyle.medium(fontWeight: FontWeight.w700),),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),color: AppColors.lytwhite),
                         
                          child: Row(
                            children: [
                              Icon(Icons.shopping_bag_outlined,color: AppColors.green,size: 15,),
                              SizedBox(width: 5,),
                              Text("Add Cart",style: AppTextstyle.small(fontColor: AppColors.green),),
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
