import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:g7_comerce_app/core/utils/bottom_navigation.dart';
import 'package:g7_comerce_app/features/dashboard/screens/customer_dashboard.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home: BottomNavigationWidget(),
    );
  }
}
