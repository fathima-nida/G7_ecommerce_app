import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g7_comerce_app/core/theme/app_colors.dart';
import 'package:g7_comerce_app/core/theme/textstyle.dart';
import 'package:g7_comerce_app/presentation/bloc/dashboard/order_view/order_view_bloc.dart';
import 'package:intl/intl.dart';

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
      {"title": "Processing"},
      {"title": "Pending"},
      {"title": "Delivered"},
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
        color: AppColors.white,
      ),
      child: const Icon(Icons.image_not_supported, color: AppColors.grey),
    );
  }

  // Date formate like date-ymonth-year
  
  String formatDateOnly(dynamic date) {
  if (date == null) return "-";

  try {
    DateTime dt;

    if (date is DateTime) {
      dt = date;
    } else {
      dt = DateTime.parse(date.toString());
    }

    return DateFormat("dd-MM-yyyy").format(dt);
  } catch (e) {
    return "-";
  }
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
                              // '20-12-2025',
                              formatDateOnly(orderView.date),
                              
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
