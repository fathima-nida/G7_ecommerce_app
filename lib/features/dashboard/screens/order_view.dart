import 'package:flutter/material.dart';
import 'package:g7_comerce_app/core/constant/app_colors.dart';
import 'package:g7_comerce_app/core/constant/textstyle.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Order View', style: AppTextstyle.medium()),
        elevation: 0, // remove shadow if you want a clean line
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 1,
            color: AppColors.lighteGrey, // line color
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'order Number',
                              style: AppTextstyle.small(
                                fontSize: 12,
                                fontColor: AppColors.grey,
                              ),
                            ),
                            Text(
                              '#978665',
                              style: AppTextstyle.small(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Total'),
                            Row(
                              children: [
                                Icon(
                                  Icons.currency_rupee_sharp,
                                  color: AppColors.green,
                                  size: 14,
                                  weight: 700,
                                ),
                                Text(
                                  '29,999',
                                  style: AppTextstyle.small(
                                    fontWeight: FontWeight.w700,
                                    fontColor: AppColors.green,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      'Customer Name',
                      style: AppTextstyle.small(
                        fontSize: 12,
                        fontColor: AppColors.grey,
                      ),
                    ),
                    Text(
                      'Mohammed Shafeeque',
                      style: AppTextstyle.small(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'Route',
                      style: AppTextstyle.small(
                        fontSize: 12,
                        fontColor: AppColors.grey,
                      ),
                    ),
                    Text(
                      'Perinthelmanna',
                      style: AppTextstyle.small(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: AppColors.lighteGrey),
                    top: BorderSide(color: AppColors.lighteGrey, width: 1),
                  ),
                ),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.symmetric(horizontal: 0),
                  shape: Border.all(color: AppColors.white),
                  title: Text(
                    '1 Item Delivered',
                    style: AppTextstyle.medium(fontWeight: FontWeight.w700),
                  ),
                  subtitle: Row(
                    children: [
                      Text(
                        'Placed on',
                        style: AppTextstyle.small(
                          fontSize: 12,
                          fontColor: AppColors.grey,
                        ),
                      ),
                      SizedBox(width: 7),
                      Text(
                        '20-12-2025',
                        style: AppTextstyle.small(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          fontColor: AppColors.red,
                        ),
                      ),
                    ],
                  ),
                  children: [
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: AppColors.skyBlue),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Processing'),
                            Text('20-Dec-2025,03:10 PM'),
                          ],
                        ),
                      ],
                    ),
                    Container(height: 30, width: 2, color: AppColors.skyBlue),
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: AppColors.skyBlue),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Pending'),
                            Text('20-Dec-2025,03:10 PM'),
                          ],
                        ),
                      ],
                    ),
                    Container(height: 30, width: 2, color: AppColors.skyBlue),
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: AppColors.skyBlue),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Delivered'),
                            Text('20-Dec-2025,03:10 PM'),
                          ],
                        ),
                      ],
                    ),
                    Container(height: 30, width: 2, color: AppColors.skyBlue),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.greyWhite,
                  border: Border.all(width: 1, color: AppColors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
