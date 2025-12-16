import 'package:flutter/material.dart';
import 'package:g7_comerce_app/core/constant/app_colors.dart';
import 'package:g7_comerce_app/core/constant/textstyle.dart';

class DeliveryDashboard extends StatelessWidget {
  const DeliveryDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Delivery Dashboard')),

      body: Column(
        children: [
          SizedBox(height: 20),
          Container(
            height: 135,
            width: 380,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                transform: GradientRotation(10),
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.purple, AppColors.lightpink],
                stops: [0.010, 1.000],
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Pending',
                          style: AppTextstyle.large(
                            fontColor: AppColors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '(Dispatched)',
                          style: AppTextstyle.small(
                            fontColor: AppColors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.white,
                      child: Center(
                        child: Icon(
                          Icons.print_outlined,
                          color: AppColors.lightpink,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
