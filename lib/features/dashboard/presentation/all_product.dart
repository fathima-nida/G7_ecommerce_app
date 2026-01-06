import 'package:flutter/material.dart';
import 'package:g7_comerce_app/core/theme/app_colors.dart';
import 'package:g7_comerce_app/core/theme/textstyle.dart';
import 'package:g7_comerce_app/features/dashboard/presentation/order_view.dart';

class AllProduct extends StatelessWidget {
  AllProduct({super.key});

  final List<Map<String, dynamic>> card = [
    {'status': 'Processing', 'color': AppColors.skyBlue},
    {'status': 'Pending', 'color': AppColors.red},
    {'status': 'Delivered', 'color': AppColors.green},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        shape: const Border(
          bottom: BorderSide(color: AppColors.lighteGrey, width: 1),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('All Product', style: AppTextstyle.medium()),
      ),
      body: ListView.builder(
        itemCount: 10,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemBuilder: (context, index) {
          final item = card[index % card.length];
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderView()),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.239,
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.greyWhite,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                              Text(
                                'Status',
                                style: AppTextstyle.small(
                                  fontColor: AppColors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                item['status'],
                                style: AppTextstyle.small(
                                  fontColor: item['color'],
                                  fontWeight: FontWeight.w500,
                                ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Date',
                                style: AppTextstyle.small(
                                  fontSize: 12,
                                  fontColor: AppColors.grey,
                                ),
                              ),
                              Text(
                                '20-Dec-2025',
                                style: AppTextstyle.small(
                                  fontColor: AppColors.pink,
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
                                    '890.00',
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
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }
}
