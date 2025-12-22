

import 'package:flutter/material.dart';
import 'package:g7_comerce_app/core/constant/app_colors.dart';
import 'package:g7_comerce_app/core/constant/asset_resources.dart';
//import 'package:g7_comerce_app/core/constant/asset_resource.dart';
import 'package:g7_comerce_app/core/constant/textstyle.dart';


// profile screen

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pink,

      body: Column(
        children: [
          
          Container(
            height: 220,
            width: double.infinity,
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 50,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(AssetResources.profile),
                ),
                const SizedBox(width: 12),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ahmed Raza",
                      style: AppTextstyle.medium(
                        fontSize: 18,
                        fontColor: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "ahmedraza@gmail.com",
                      style: AppTextstyle.small(
                        fontColor: AppColors.white,
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                const Icon(
                  Icons.logout,
                  color: AppColors.white,
                )
              ],
            ),
          ),

          
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ListView(
                padding: const EdgeInsets.only(top: 30),
                children: [
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    child: Text(
                      "Personal Information",
                      style: AppTextstyle.medium(),
                    ),
                  ),

                  ListTile(
                    leading:
                        const Icon(Icons.edit, color: AppColors.pink),
                    title: Text(
                      "Profile Edit",
                      style: AppTextstyle.medium(
                        fontColor: AppColors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing:
                        const Icon(Icons.arrow_forward_ios),
                  ),

                  ListTile(
                    leading: const Icon(Icons.dashboard,
                        color: AppColors.pink),
                    title: Text(
                      "Order Dashboard",
                      style: AppTextstyle.medium(
                        fontColor: AppColors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing:
                        const Icon(Icons.arrow_forward_ios),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    child: Text(
                      "Support & Information",
                      style: AppTextstyle.medium(),
                    ),
                  ),

                  ListTile(
                    leading: const Icon(Icons.privacy_tip,
                        color: AppColors.pink),
                    title: Text(
                      "Privacy Policy",
                      style: AppTextstyle.medium(
                        fontColor: AppColors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing:
                        const Icon(Icons.arrow_forward_ios),
                  ),

                  ListTile(
                    leading: const Icon(Icons.description,
                        color: AppColors.pink),
                    title: Text(
                      "Terms & Conditions",
                      style: AppTextstyle.medium(
                        fontColor: AppColors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  ListTile(
                    leading: const Icon(Icons.help_outline,
                        color: AppColors.pink),
                    title: Text(
                      "FAQs",
                      style: AppTextstyle.medium(
                        fontColor: AppColors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    child: Text(
                      "Account Management",
                      style: AppTextstyle.medium(),
                    ),
                  ),

                  ListTile(
                    leading:
                        const Icon(Icons.lock, color: AppColors.pink),
                    title: Text(
                      "Change Password",
                      style: AppTextstyle.medium(
                        fontColor: AppColors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing:
                        const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


