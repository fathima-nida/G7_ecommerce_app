import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:g7_comerce_app/core/utils/bottom_navigation.dart';
import 'package:g7_comerce_app/features/auth/screens/loginscreen.dart';
import 'package:g7_comerce_app/features/auth/screens/splashscreen.dart';
import 'package:g7_comerce_app/features/screens/customer_choose.dart';
import 'package:g7_comerce_app/features/screens/favourite.dart';
import 'package:g7_comerce_app/features/screens/product%20view.dart';
import 'package:g7_comerce_app/features/auth/screens/splashscreen.dart';
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
