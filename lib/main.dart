import 'package:flutter/material.dart';
import 'package:g7_comerce_app/features/auth/screens/loginscreen.dart';
import 'package:g7_comerce_app/features/category/screens/chargerlist.dart';
import 'package:g7_comerce_app/features/home/screens/homescreen.dart';
import 'package:g7_comerce_app/features/home/screens/widgets/carousal.dart';

import 'package:g7_comerce_app/features/auth/screens/splashscreen.dart';
import 'package:g7_comerce_app/features/category/screens/categorypage.dart';
 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
     
      home:Homescreen()
    );
  }
}
