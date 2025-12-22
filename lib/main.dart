import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:g7_comerce_app/core/utils/bottom_navigation.dart';
import 'package:g7_comerce_app/features/auth/screens/splashscreen.dart';
import 'package:g7_comerce_app/features/cart/cartlists.dart';
import 'package:g7_comerce_app/features/category/screens/chargerlist.dart';

void main() {

WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
  );

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      home: CartScreen(),
    );
  }
}
