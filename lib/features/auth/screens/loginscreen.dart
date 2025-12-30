import 'package:flutter/material.dart';
import 'package:g7_comerce_app/core/constant/app_colors.dart';
import 'package:g7_comerce_app/core/constant/asset_resources.dart';
import 'package:g7_comerce_app/core/constant/textstyle.dart';
import 'package:g7_comerce_app/core/utils/bottom_navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
bool showPassword=true;

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(AssetResources.logo, height: 77),
            ),
            SizedBox(height: 30),
            Text("Sign in to your Account", style: AppTextstyle.large()),
            Text(
              "Enter your mobile number to login",
              style: AppTextstyle.small(fontColor: AppColors.grey),
            ),
            SizedBox(height: 30),
            Text(
              "Mobile number",
              style: AppTextstyle.small(fontColor: AppColors.grey),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: TextEditingController(),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                label: Text(
                  "Enter your Mobile number",
                  style: AppTextstyle.small(fontColor: AppColors.grey),
                ),
                prefixIcon: Icon(Icons.phone, size: 27,color: AppColors.pink),
              ),
            ),
            

            SizedBox(height: 70,),
           
       Center(
        child: ElevatedButton(
         style:ElevatedButton.styleFrom(
          backgroundColor: AppColors.pink,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10)
        )
         ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigationWidget()));
          }, child: Container(
            width: 274,
            height: 51,
            child: Center(child: Text("Login",style: AppTextstyle.medium(fontColor: AppColors.white),)))),
         
       ),
       
          ],
        ),
      ),
    );
  }
}
