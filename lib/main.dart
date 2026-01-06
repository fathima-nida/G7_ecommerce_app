import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:g7_comerce_app/features/auth/presentaion/loginscreen.dart';

import 'package:g7_comerce_app/features/favourite/customer_choose.dart';
import 'package:g7_comerce_app/features/favourite/presentation/favourite.dart';
import 'package:g7_comerce_app/features/home/screens/product%20view.dart';
import 'package:g7_comerce_app/features/dashboard/screens/customer_dashboard.dart';
import 'package:g7_comerce_app/features/home/screens/searchscreen.dart';
import 'package:g7_comerce_app/features/profile/screens/profile.dart';
//import 'package:g7_comerce_app/features/search/screens/searchscreen.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: LoginScreen(),
    );
  }
}
