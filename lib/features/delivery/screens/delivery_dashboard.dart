import 'package:flutter/material.dart';
import 'package:g7_comerce_app/core/constant/app_colors.dart';


class DeliveryDashboard extends StatelessWidget {
  const DeliveryDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Dashboard'),
      ),

      body: Column(
        children: [
          Container(
            height: 135,
            width: 380,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.lightpink,AppColors.purple],
                stops: [0.007,1.0609],
                )
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Text('Pending'),
                        Text('(Dispatched)')
                      ],
                    ),
                    Icon(Icons.print)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}