import 'package:flutter/material.dart';
import 'package:g7_comerce_app/features/auth/screens/splashscreen.dart';
import 'package:g7_comerce_app/features/category/screens/categorypage.dart';
import 'package:g7_comerce_app/features/delivery/screens/delivery_dashboard.dart';

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
     
      home:CategoryPage(),
    );
  }
}
