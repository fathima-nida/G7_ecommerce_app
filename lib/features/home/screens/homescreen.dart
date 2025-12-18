import 'package:flutter/material.dart';
import 'package:g7_comerce_app/core/constant/app_colors.dart';
import 'package:g7_comerce_app/core/constant/asset_resources.dart';
import 'package:g7_comerce_app/core/constant/textstyle.dart';

class Homescreen extends StatefulWidget {
   Homescreen({super.key});
  final List<String> imagelist = [
  AssetResources.headset,
  AssetResources.mobilestand,
  AssetResources.screenguard,
];
final List<String> nameList = [
  "Headset"
      "Mobile Stand"
      "Screenfuard",
];

  @override
  State<Homescreen> createState() => _HomescreenState();
}



class _HomescreenState extends State<Homescreen> {
  
  @override
  Widget build(BuildContext context) {
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
                          backgroundImage: AssetImage(AssetResources.backcover),
                          radius: 35,
                        ),
                        Text(
                          "Backcovers",
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
                            AssetResources.mobilestand,
                          ),
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
                  style: AppTextstyle.large(fontSize: 16),
                ),
              ),
              // GridView.builder(
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount:3,
              //   ),itemCount:widget.imagelist.length,
              //   itemBuilder: (context,index){
              //    return Container(
              //    child: Icon(Icons.favorite_border_outlined),
              //     height: 186,
              //     width: 128,
              //    );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
