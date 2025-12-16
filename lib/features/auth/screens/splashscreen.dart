import 'package:flutter/material.dart';
import 'package:g7_comerce_app/core/constant/asset_resources.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AssetResources.logo),
       
      ),
    );
  }
}