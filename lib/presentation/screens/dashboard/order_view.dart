// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:g7_comerce_app/core/theme/app_colors.dart';
// import 'package:g7_comerce_app/core/theme/textstyle.dart';
// import 'package:g7_comerce_app/core/theme/asset_resources.dart';
// import 'package:g7_comerce_app/domain/dashboard/models/sales_orders_resp_model.dart';
// import 'package:g7_comerce_app/presentation/bloc/dashboard/order_view/order_view_bloc.dart';
// import 'package:g7_comerce_app/utils/shared_pref_helper/shared_pref_helper.dart';

// class OrderView extends StatefulWidget {
//   final int? orderId;

//   const OrderView({super.key, this.orderId});

//   @override
//   State<OrderView> createState() => _OrderViewState();
// }

// class _OrderViewState extends State<OrderView> {
//   List<Step> stepList() => [
//     Step(
//       title: Text('Processing', style: AppTextstyle.small()),
//       subtitle: Text(
//         '30-Dec-2025, 03:10 PM',
//         style: AppTextstyle.small(fontSize: 12, fontColor: AppColors.grey),
//       ),
//       content: Center(child: Text('processing', style: AppTextstyle.small())),
//       state: StepState.complete,
//     ),
//     Step(
//       title: Text('Pending', style: AppTextstyle.small()),
//       subtitle: Text(
//         '20-Dec-2025, 03:310 PM',
//         style: AppTextstyle.small(fontSize: 12, fontColor: AppColors.grey),
//       ),
//       content: Center(child: Text('pending')),
//       state: StepState.complete,
//     ),
//     Step(
//       title: Text('Delivered', style: AppTextstyle.small()),
//       content: Center(child: Text('delivered', style: AppTextstyle.small())),
//       state: StepState.editing,
//     ),
//   ];

//   int getCurrentStep(List<Step> steps) {
//     final index = steps.indexWhere((step) => step.state == StepState.editing);
//     return index == -1 ? 0 : index; // fallback safety
//   }

//   Color getConnectorColor(int stepIndex) {
//     if (stepIndex < getCurrentStep(stepList())) {
//       return AppColors.skyBlue; // completed
//     } else if (stepIndex == getCurrentStep(stepList())) {
//       return AppColors.red; // active
//     } else {
//       return AppColors.grey; // upcoming
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _loadOrders();
//   }

//   Future<void> _loadOrders() async {
//     if (widget.orderId == null) return;

//     context.read<OrderViewBloc>().add(
//       LoadOrderViewEvent(orderId: widget.orderId!),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: AppBar(
//         backgroundColor: AppColors.white,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(Icons.arrow_back),
//         ),
//         title: Text('Order View', style: AppTextstyle.medium()),
//         elevation: 0,
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(1),
//           child: Container(
//             height: 1,
//             color: AppColors.lighteGrey, // line color
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 12),
//           child: BlocBuilder<OrderViewBloc, OrderViewState>(
//             builder: (context, state) {
//               if (state is OrderViewInitial) {
//                 return Center(child: CircularProgressIndicator());
//               }
//               if (state is OrderViewLoading) {
//                 return Center(child: CircularProgressIndicator());
//               }
//               if (state is OrderViewFailure) {
//                 return Center(child: Text(state.message));
//               }
//               if (state is OrderViewSuccess) {
//                 final orderView = state.orderViewRespModel;
//                 // final data = orderView.data;
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 180,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'order Number',
//                                     style: AppTextstyle.small(
//                                       fontSize: 12,
//                                       fontColor: AppColors.grey,
//                                     ),
//                                   ),
//                                   Text(
//                                     // '#978665',
//                                     // data.first.customerId.toString(),
//                                     orderView.orderNo.toString(),

//                                     style: AppTextstyle.small(
//                                       fontWeight: FontWeight.w700,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   Text('Total'),
//                                   Row(
//                                     children: [
//                                       Icon(
//                                         Icons.currency_rupee_sharp,
//                                         color: AppColors.green,
//                                         size: 14,
//                                         weight: 700,
//                                       ),
//                                       Text(
//                                         // '29,999',
//                                         // data.first.total.toString(),
//                                         orderView.totalAmount.toString(),

//                                         style: AppTextstyle.small(
//                                           fontWeight: FontWeight.w700,
//                                           fontColor: AppColors.green,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Text(
//                             'Customer Name',
//                             style: AppTextstyle.small(
//                               fontSize: 12,
//                               fontColor: AppColors.grey,
//                             ),
//                           ),
//                           Text(
//                             // 'Mohammed Shafeeque',
//                             orderView.customerName.toString(),
//                             style: AppTextstyle.small(
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                           Text(
//                             'Route',
//                             style: AppTextstyle.small(
//                               fontSize: 12,
//                               fontColor: AppColors.grey,
//                             ),
//                           ),
//                           Text(
//                             // 'Perinthelmanna',
//                             orderView.routeName.isEmpty
//                                 ? '_'
//                                 : orderView.routeName.toString(),
//                             style: AppTextstyle.small(
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 12),
//                     Container(
//                       decoration: BoxDecoration(
//                         border: Border(
//                           bottom: BorderSide(
//                             width: 1,
//                             color: AppColors.lighteGrey,
//                           ),
//                           top: BorderSide(
//                             color: AppColors.lighteGrey,
//                             width: 1,
//                           ),
//                         ),
//                       ),
//                       child: ExpansionTile(
//                         tilePadding: EdgeInsets.symmetric(horizontal: 0),
//                         shape: Border.all(color: AppColors.white),
//                         title: Text(
//                           '1 Item Delivered',
//                           style: AppTextstyle.medium(
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         subtitle: Row(
//                           children: [
//                             Text(
//                               'Placed on',
//                               style: AppTextstyle.small(
//                                 fontSize: 12,
//                                 fontColor: AppColors.grey,
//                               ),
//                             ),
//                             SizedBox(width: 7),
//                             Text(
//                               '20-12-2025',
//                               style: AppTextstyle.small(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w600,
//                                 fontColor: AppColors.red,
//                               ),
//                             ),
//                           ],
//                         ),
//                         children: [
//                           Theme(
//                             data: Theme.of(context).copyWith(
//                               // dividerColor: getConnectorColor(
//                               //   getCurrentStep(stepList()),
//                               // ),
//                               colorScheme: Theme.of(context).colorScheme
//                                   .copyWith(
//                                     onSurface:
//                                         Colors.white, // removes grey circle
//                                     primary: Colors.white, // active circle
//                                   ),
//                             ),
//                             child: Stepper(
//                               type: StepperType.vertical,
//                               currentStep: getCurrentStep(stepList()),
//                               connectorThickness: 2,
//                               // connectorColor: getConnectorColor(
//                               //   getCurrentStep(stepList()),
//                               // ) ,
//                               physics: const NeverScrollableScrollPhysics(),
//                               controlsBuilder: (context, details) {
//                                 return const SizedBox();
//                               },
//                               stepIconHeight: 25,
//                               stepIconWidth: 25,
//                               // stepIconMargin: EdgeInsets.all(0),
//                               stepIconBuilder: (stepIndex, stepState) {
//                                 return Center(
//                                   child: Icon(
//                                     Icons.check_circle,
//                                     color: stepState == StepState.complete
//                                         ? AppColors.skyBlue
//                                         : stepState == StepState.editing
//                                         ? AppColors.red
//                                         : AppColors.grey,
//                                     size: 25,
//                                   ),
//                                 );
//                               },
//                               steps: stepList(),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 12),
//                     ListView.separated(
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       itemBuilder: (BuildContext context, int index) {
//                         return Container(
//                           height: MediaQuery.of(context).size.height * 0.18,
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               color: AppColors.lighteGrey,
//                               width: 0.5,
//                             ),
//                             borderRadius: BorderRadius.circular(8),
//                             color: AppColors.white,
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               children: [
//                                 Image.network(
//                                   // AssetResources.headset,
//                                   orderView.cartItems[index].images.first,
//                                   // width: 72,
//                                   height: 72,
//                                 ),
//                                 SizedBox(width: 10),
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         // 'Your resources to diccover and connect with designers',
//                                         orderView.cartItems[index].itemName,
//                                         style: AppTextstyle.small(
//                                           fontWeight: FontWeight.w500,
//                                           fontColor: AppColors.grey,
//                                         ),
//                                         maxLines: 5,
//                                         overflow: TextOverflow.ellipsis,
//                                       ),
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             Icons.currency_rupee_rounded,
//                                             size: 19,
//                                           ),
//                                           Text(
//                                             // '29,999',
//                                             orderView.cartItems[index].price
//                                                 .toString(),
//                                             style: AppTextstyle.medium(
//                                               fontWeight: FontWeight.w700,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       Container(
//                                         padding: EdgeInsets.all(5),
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(
//                                             10,
//                                           ),
//                                           color: AppColors.greyWhite,
//                                         ),
//                                         child: Text(
//                                           'Your resources to discover and connect with designers',
//                                           style: AppTextstyle.small(
//                                             fontSize: 12,
//                                             fontWeight: FontWeight.w500,
//                                             fontColor: AppColors.grey,
//                                           ),
//                                           maxLines: 5,
//                                           overflow: TextOverflow.ellipsis,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                       separatorBuilder: (BuildContext context, int index) {
//                         return SizedBox(height: 10);
//                       },
//                       itemCount: orderView.cartItems.length,
//                     ),
//                   ],
//                 );
//               }
//               return const SizedBox();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g7_comerce_app/core/theme/app_colors.dart';
import 'package:g7_comerce_app/core/theme/textstyle.dart';
import 'package:g7_comerce_app/presentation/bloc/dashboard/order_view/order_view_bloc.dart';

class OrderView extends StatefulWidget {
  final int? orderId;

  const OrderView({super.key, this.orderId});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  void initState() {
    super.initState();
    _loadOrders();
  }

  Future<void> _loadOrders() async {
    if (widget.orderId == null) return;

    context.read<OrderViewBloc>().add(
      LoadOrderViewEvent(orderId: widget.orderId!),
    );
  }

  int getStepIndexFromStatus(String status) {
    switch (status.toLowerCase()) {
      case "processing":
        return 0;
      case "pending":
        return 1;
      case "delivered":
        return 2;
      default:
        return 0;
    }
  }

  /// ✅ Custom tracker UI (Stepper alternative)
  Widget orderStatusTracker({required int currentStep}) {
    final steps = [
      {"title": "Processing", "date": "30-Dec-2025, 03:10 PM"},
      {"title": "Pending", "date": "20-Dec-2025, 03:10 PM"},
      {"title": "Delivered", "date": "Delivered Date"},
    ];

    return Column(
      children: List.generate(steps.length, (index) {
        final isCompleted = index < currentStep;
        final isActive = index == currentStep;

        Color circleColor = isCompleted
            ? AppColors.skyBlue
            : isActive
            ? AppColors.red
            : AppColors.grey;

        Color lineColor = index < currentStep
            ? AppColors.skyBlue
            : AppColors.grey;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// LEFT ICON + CONNECTOR LINE
            Column(
              children: [
                Icon(Icons.check_circle, color: circleColor, size: 25),

                /// connector line
                if (index != steps.length - 1)
                  Container(
                    width: 2,
                    height: 50,
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    color: lineColor,
                  ),
              ],
            ),

            const SizedBox(width: 12),

            /// RIGHT TEXT
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      steps[index]["title"].toString(),
                      style: AppTextstyle.small(
                        fontWeight: FontWeight.w700,
                        fontColor: isActive ? AppColors.red : AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      steps[index]["date"].toString(),
                      style: AppTextstyle.small(
                        fontSize: 12,
                        fontColor: AppColors.grey,
                      ),
                    ),
                    const SizedBox(height: 18),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  /// ✅ Safe network image (fix images.first crash)
  Widget cartItemImage(List<String> images) {
    if (images.isNotEmpty && images.first.isNotEmpty) {
      return Image.network(
        images.first,
        height: 75,
        width: 72,
        fit: BoxFit.fill,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 72,
            width: 72,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.lighteGrey,
            ),
            child: const Icon(Icons.image_not_supported),
          );
        },
      );
    }

    return Container(
      height: 72,
      width: 72,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.lighteGrey,
      ),
      child: const Icon(Icons.image_not_supported),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text('Order View', style: AppTextstyle.medium()),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: AppColors.lighteGrey),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: BlocBuilder<OrderViewBloc, OrderViewState>(
            builder: (context, state) {
              if (state is OrderViewInitial || state is OrderViewLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is OrderViewFailure) {
                return Center(child: Text(state.message));
              }

              if (state is OrderViewSuccess) {
                final orderView = state.orderViewRespModel;

                final status = orderView.status;

                final currentStep = getStepIndexFromStatus(status);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// ---------------- ORDER INFO ----------------
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
                                    orderView.orderNo.toString(),
                                    style: AppTextstyle.small(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('Total', style: AppTextstyle.small()),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.currency_rupee_sharp,
                                        color: AppColors.green,
                                        size: 14,
                                      ),
                                      Text(
                                        orderView.totalAmount.toString(),
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
                            orderView.customerName.toString(),
                            style: AppTextstyle.small(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Route',
                            style: AppTextstyle.small(
                              fontSize: 12,
                              fontColor: AppColors.grey,
                            ),
                          ),
                          Text(
                            orderView.routeName.isEmpty
                                ? '_'
                                : orderView.routeName.toString(),
                            style: AppTextstyle.small(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    /// ---------------- ORDER TRACKER ----------------
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: AppColors.lighteGrey,
                          ),
                          top: BorderSide(
                            color: AppColors.lighteGrey,
                            width: 1,
                          ),
                        ),
                      ),
                      child: ExpansionTile(
                        tilePadding: const EdgeInsets.symmetric(horizontal: 0),
                        shape: Border.all(color: AppColors.white),
                        title: Text(
                          '1 Item Delivered',
                          style: AppTextstyle.medium(
                            fontWeight: FontWeight.w700,
                          ),
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
                            const SizedBox(width: 7),
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
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 12,
                            ),
                            child: orderStatusTracker(currentStep: currentStep),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    /// ---------------- CART ITEMS ----------------
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: orderView.cartItems.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final item = orderView.cartItems[index];

                        return Container(
                          height: MediaQuery.of(context).size.height * 0.18,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.lighteGrey,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                cartItemImage(item.images),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        item.itemName,
                                        style: AppTextstyle.small(
                                          fontWeight: FontWeight.w500,
                                          fontColor: AppColors.grey,
                                        ),
                                        maxLines: 5,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.currency_rupee_rounded,
                                            size: 19,
                                          ),
                                          Text(
                                            item.price.toString(),
                                            style: AppTextstyle.medium(
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          color: AppColors.greyWhite,
                                        ),
                                        child: Text(
                                          'Your resources to discover and connect with designers',
                                          style: AppTextstyle.small(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            fontColor: AppColors.grey,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
