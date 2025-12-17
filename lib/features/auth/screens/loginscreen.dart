import 'package:flutter/material.dart';
import 'package:g7_comerce_app/core/constant/app_colors.dart';
import 'package:g7_comerce_app/core/constant/asset_resources.dart';
import 'package:g7_comerce_app/core/constant/textstyle.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Image.asset(AssetResources.logo, height: 77),
            ),
            SizedBox(height: 30),
            Text("Sign in to your Account", style: AppTextstyle.large()),
            Text(
              "Enter your email and password to login",
              style: AppTextstyle.small(fontColor: AppColors.grey),
            ),
            SizedBox(height: 20),
            Text(
              "Email address",
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
                  "Enter your email",
                  style: AppTextstyle.small(fontColor: AppColors.grey),
                ),
                prefixIcon: Icon(Icons.email_outlined, color: AppColors.pink),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Password",
              style: AppTextstyle.small(fontColor: AppColors.grey),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: TextEditingController(),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                label: Text("Enter your pasword",style: AppTextstyle.small(fontColor: AppColors.grey),),
                prefixIcon: Icon(Icons.lock_outline, color: AppColors.pink),
                suffixIcon:showPassword?
                 Icon(Icons.visibility_off_outlined):
                 Icon(Icons.visibility_outlined)
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 210),
              child: Text(
                "Forgot Your Password?",
                
                style: AppTextstyle.small(fontColor: AppColors.pink,fontWeight: FontWeight.w500),
              ),
            ),SizedBox(height: 80,),
           
       Center(
         child: FloatingActionButton(onPressed: (){},
       
         backgroundColor: AppColors.pink,
         child: Text("Login",style: AppTextstyle.medium(fontColor: AppColors.white),),
         ),
       ),
       SizedBox(height: 30,),
       Center(child: Text("Salesman Account Login?",style: AppTextstyle.small(fontColor: AppColors.grey),))
          ],
        ),
      ),
    );
  }
}
