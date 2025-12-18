import 'package:flutter/material.dart';
import 'package:g7_comerce_app/core/constant/app_colors.dart';
import 'package:g7_comerce_app/core/constant/textstyle.dart';
import 'package:g7_comerce_app/core/constant/asset_resources.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  List<Step> stepList() => [
    const Step(
      title: Text('Processing'),
      subtitle: Text('30-Dec_2025, 03:10 PM'),
      content: Center(child: Text('processing')),
      state: StepState.complete,
    ),
    const Step(
      title: Text('Pending'),
      subtitle: Text('20-Dec-2025, 03:310 PM'),
      content: Center(child: Text('pending')),
      state: StepState.editing,
    ),
    const Step(
      title: Text('Delivered'),
      content: Center(child: Text('delivered')),
      state: StepState.indexed,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    int currentStep = 1;
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
          padding: const EdgeInsets.all(18.0),
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
                    Column(
                      children: [
                        _orderStep(
                          title: 'Processing',
                          time: '20-Dec-2025, 03:10 PM',
                          isCompleted: true,
                          isLast: false,
                        ),
                        _orderStep(
                          title: 'Pending',
                          time: '20-Dec-2025, 04:00 PM',
                          isCompleted: false,
                          isLast: false,
                        ),
                        _orderStep(
                          title: 'Delivered',
                          time: 'Expected soon',
                          isCompleted: false,
                          isLast: true,
                        ),
                      ],
                    ),

                    // Stepper(

                    //   currentStep: currentStep,
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   controlsBuilder: (context, details) {
                    //     return const SizedBox(); // hide continue/cancel buttons
                    //   },
                    //   stepIconBuilder: (stepIndex, stepState) {
                    //     if (stepState == StepState.complete) {
                    //       return const Icon(
                    //         Icons.check_circle,
                    //         color: AppColors.skyBlue,
                    //       );
                    //     } else if (stepState == StepState.editing) {
                    //       return const Icon(
                    //         Icons.check_circle,
                    //         color: AppColors.red,
                    //       );
                    //     } else {
                    //       return const Icon(
                    //         Icons.check_circle,
                    //         color: AppColors.grey,
                    //       );
                    //     }
                    //   },
                    //   steps: stepList(),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.blueWhite,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset(AssetResources.headset, height: 120),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Your resources to diccover and connect with designers',
                              style: AppTextstyle.small(
                                fontWeight: FontWeight.w500,
                                fontColor: AppColors.grey,
                              ),
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: [
                                Icon(Icons.currency_rupee_rounded, size: 19),
                                Text(
                                  '29,999',
                                  style: AppTextstyle.medium(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.greyWhite,
                              ),
                              child: Text(
                                'Your resources to discover and connect with designers',
                                style: AppTextstyle.small(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontColor: AppColors.grey,
                                ),
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _orderStep({
    required String title,
    required String time,
    required bool isCompleted,
    required bool isLast,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(
              isCompleted ? Icons.check_circle : Icons.check_circle,
              color: isCompleted ? AppColors.skyBlue : AppColors.grey,
              size: 22,
            ),
            if (!isLast)
              Container(
                height: 50,
                width: 2,
                color: isCompleted ? AppColors.skyBlue : AppColors.grey,
              ),
          ],
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTextstyle.small(fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            Text(
              time,
              style: AppTextstyle.small(
                fontSize: 12,
                fontColor: AppColors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
