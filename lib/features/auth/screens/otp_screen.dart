import 'package:flutter/material.dart';
import 'package:g7_comerce_app/core/theme/asset_resources.dart';
import 'package:g7_comerce_app/core/theme/textstyle.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            Center(child: Image.asset(AssetResources.logo, scale: 6)),
            SizedBox(height: 20),
            Center(
              child: Text("Enter Your Otp Number", style: AppTextstyle.large()),
            ),
            SizedBox(height: 90),
            Pinput(
              length: 6,
              keyboardType: TextInputType.number,
              onCompleted: (pin) {},
              defaultPinTheme: PinTheme(
                width: 55,
                height: 55,
                textStyle: AppTextstyle.large(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
              ),
              focusedPinTheme: PinTheme(
                height: 60,
                width: 60,
                textStyle: AppTextstyle.large(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
