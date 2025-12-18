import 'package:flutter/material.dart';
import 'package:g7_comerce_app/core/constant/app_colors.dart';
import 'package:g7_comerce_app/core/constant/textstyle.dart';

class StatusCard extends StatelessWidget {
  final String status;
  final String image;
  final String count;
  final VoidCallback onTap;
  const StatusCard({super.key, required this.status, required this.image,required this.count,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.lighteGrey, width: 0.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  status,
                  style: AppTextstyle.small(
                    fontColor: AppColors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Image.asset('$image'),
              ],
            ),
            Text('$count', style: AppTextstyle.large()),
          ],
        ),
        
      ),
    );
  }
}
