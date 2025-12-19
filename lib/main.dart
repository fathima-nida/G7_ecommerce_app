import 'package:flutter/material.dart';
import 'package:g7_comerce_app/features/screens/favourite.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home:Favourite(),
      debugShowCheckedModeBanner:false,
    );
  }
}
