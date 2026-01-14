
import 'package:flutter/material.dart';
import 'package:g7_comerce_app/core/theme/app_colors.dart';
import 'package:g7_comerce_app/core/theme/asset_resources.dart';
import 'package:g7_comerce_app/core/theme/textstyle.dart';
import 'package:g7_comerce_app/presentation/screens/dashboard/customer_dashboard.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pink,
      body: Column(
        children: [
          /// TOP PROFILE SECTION
          Container(
            height: 220,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
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

                //Image.asset(AssetResources.logout, width: 28, height: 28),
                GestureDetector(
                  onTap: () {
                    showDialog(context: context,
                     builder: (context){
                      return AlertDialog(
                        title: const Text("Logout"),
                        content: const Text(
                          "Are you sure you want to logout?",
                        ),
                        actions: [
                          TextButton(
                            onPressed: (){
                              Navigator.pop(context);
                            }, 
                            child: const Text("Cancle"),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.pink,
                              ),
                              onPressed: (){
                                Navigator.pop(context);
                              }, 
                              child: const Text("Logout"),
                              ),
                        ],
                      );
                     }
                     );
                  },
                )
              ],
            ),
          ),

          /// CONTENT SECTION
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
                  /// PERSONAL INFO
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    child: Text(
                      "Personal Information",
                      style: AppTextstyle.medium(),
                    ),
                  ),

                  ListTile(
                    leading: Image.asset(
                      AssetResources.edit,
                      width: 20,
                      height: 20,
                    ),
                    title: Text(
                      "Profile Edit",
                      style: AppTextstyle.medium(
                        fontColor: AppColors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.grey,
                    ),
                  ),

                  /// ORDER DASHBOARD (IMAGE CLICK NAVIGATION)
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomerDashboard(),
                        ),
                      );
                    },
                    leading: Image.asset(
                      AssetResources.order,
                      width: 20,
                      height: 20,
                    ),
                    title: Text(
                      "Order Dashboard",
                      style: AppTextstyle.medium(
                        fontColor: AppColors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.grey,
                    ),
                  ),

                  /// SUPPORT
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    child: Text(
                      "Support & Information",
                      style: AppTextstyle.medium(),
                    ),
                  ),

                  ListTile(
                    leading: Image.asset(
                      AssetResources.tick,
                      width: 20,
                      height: 20,
                    ),
                    title: Text(
                      "Privacy Policy",
                      style: AppTextstyle.medium(
                        fontColor: AppColors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.grey,
                    ),
                  ),

                  ListTile(
                    leading: Image.asset(
                      AssetResources.document,
                      width: 20,
                      height: 20,
                    ),
                    title: Text(
                      "Terms & Conditions",
                      style: AppTextstyle.medium(
                        fontColor: AppColors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.grey,
                    ),
                  ),

                  ListTile(
                    leading: Image.asset(
                      AssetResources.questionmark,
                      width: 20,
                      height: 20,
                    ),
                    title: Text(
                      "FAQs",
                      style: AppTextstyle.medium(
                        fontColor: AppColors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.grey,
                    ),
                  ),

                  /// ACCOUNT
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    child: Text(
                      "Account Management",
                      style: AppTextstyle.medium(),
                    ),
                  ),

                  ListTile(
                    leading: Image.asset(
                      AssetResources.lock,
                      width: 20,
                      height: 20,
                    ),
                    title: Text(
                      "Change Password",
                      style: AppTextstyle.medium(
                        fontColor: AppColors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.grey,
                    ),
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

