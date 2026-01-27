import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g7_comerce_app/core/theme/app_colors.dart';
import 'package:g7_comerce_app/core/theme/asset_resources.dart';
import 'package:g7_comerce_app/core/theme/textstyle.dart';
import 'package:g7_comerce_app/presentation/bloc/dashboard/customer_dashboard/cstmr_dashboard_bloc.dart';
import 'package:g7_comerce_app/presentation/screens/dashboard/all_product.dart';
import 'package:g7_comerce_app/presentation/screens/dashboard/widgets/calender_picker.dart';
import 'package:intl/intl.dart';

class CustomerDashboard extends StatefulWidget {
  CustomerDashboard({super.key});

  @override
  State<CustomerDashboard> createState() => _CustomerDashboardState();
}

class _CustomerDashboardState extends State<CustomerDashboard> {
  @override
  void initState() {
    super.initState();

    final today = DateTime.now();

    fromDate = today;
    toDate = today;

    context.read<CstmrDashboardBloc>().add(
      LoadCstmrDashboardEvent(fromDate: fromDate!, toDate: toDate!),
    );
  }

  DateTime? selectedDate;
  DateTime? fromDate;
  DateTime? toDate;

  String formatDate(DateTime? date) {
    if (date == null) return "";
    return DateFormat("dd MMM yyyy").format(date); // example: 13 Jan 2026
  }

  String getDateRangeText() {
    final DateTime today = DateTime.now();

    final DateTime f = fromDate ?? today;
    final DateTime t = toDate ?? today;

    return "${formatDate(f)} - ${formatDate(t)}";
  }

  @override
  Widget build(BuildContext context) {
    Widget devider = SizedBox(height: 10);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Order Dashboard', style: AppTextstyle.medium()),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<CstmrDashboardBloc, CstmrDashboardState>(
          builder: (context, state) {
            if (state is CstmrDashboardLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is CstmrDashboardFailure) {
              return Center(child: Text(state.message));
            }
            if (state is CstmrDashboardSuccess) {
              final dashboard = state.dashboard;

              final gridItems = dashboard.data
                  .where((e) => e.status.toLowerCase() != "pending")
                  .map((e) {
                    String image = AssetResources.pending;

                    if (e.status.toLowerCase() == "accepted") {
                      image = AssetResources.accepted;
                    } else if (e.status.toLowerCase() == "billed") {
                      image = AssetResources.billed;
                    } else if (e.status.toLowerCase() == "delivered") {
                      image = AssetResources.delivered;
                    }

                    return {
                      'status': e.status,
                      'image': image,
                      'count': e.totalCount.toString(),
                    };
                  })
                  .toList();

              final orderedCount = dashboard.data.fold<int>(
                0,
                (prev, e) => prev + e.totalCount,
              );

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      pickFromToDate();
                    },
                    child: Container(
                      height: 45,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(color: AppColors.pink, width: 1),
                        color: Colors.pink.withOpacity(0.09),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          
                          Icon(
                            Icons.calendar_today_outlined,
                            color: AppColors.pink,
                          ),

                          const SizedBox(width: 8),

                          Expanded(
                            child: Text(
                              getDateRangeText(),
                              style: AppTextstyle.small(
                                fontColor: AppColors.pink,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                          IconButton(
                            onPressed: () {
                              final today = DateTime.now();

                              setState(() {
                                fromDate = today;
                                toDate = today;
                              });

                              context.read<CstmrDashboardBloc>().add(
                                LoadCstmrDashboardEvent(
                                  fromDate: fromDate!,
                                  toDate: toDate!,
                                ),
                              );
                            },
                            icon: const Icon(Icons.refresh),
                            color: AppColors.pink,

                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 17),
                  Container(
                    height: 135,
                    // width: 380,
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ordered',
                                  style: AppTextstyle.large(
                                    fontColor: AppColors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '(Pending)',
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
                                child: Image.asset(
                                  AssetResources.pending,
                                  height: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            // '54',
                            orderedCount.toString(),
                            style: AppTextstyle.large(
                              fontSize: 29,
                              fontColor: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  devider,
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AllProduct()),
                      );
                    },
                    child: Container(
                      height: 56,
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: BoxBorder.all(
                          color: AppColors.lighteGrey,
                          width: 0.5,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'All Product',
                            style: AppTextstyle.small(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            // '236',
                            dashboard.allProducts.toString(),
                            style: AppTextstyle.large(
                              fontSize: 22,
                              fontColor: AppColors.pink,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  devider,
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.5,
                      ),
                      itemCount: gridItems.length,
                      itemBuilder: (context, index) {
                        final item = gridItems[index];
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            height: MediaQuery.of(context).size.height * 3,
                            // width: 184,
                            padding: EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: AppColors.lighteGrey,
                                width: 0.5,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['status']!,
                                      style: AppTextstyle.small(
                                        fontColor: AppColors.grey,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Image.asset(item['image']!, height: 40),
                                  ],
                                ),
                                Text(
                                  item['count']!,
                                  style: AppTextstyle.large(),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Future<void> pickFromToDate() async {
    ///  Pick FROM date
    DateTime? pickedFrom = await showDatePicker(
      context: context,
      initialDate: fromDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      helpText: "From Date",
      confirmText: 'Next',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.red,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedFrom == null) return;

    setState(() {
      fromDate = pickedFrom;
      toDate = null; // reset to date
    });

    ///  Pick TO date
    DateTime? pickedTo = await showDatePicker(
      context: context,
      initialDate: pickedFrom,
      firstDate: pickedFrom, //  to date must be >= from date
      lastDate: DateTime(2100),
      helpText: "To Date",
      confirmText: 'Apply',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.red,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedTo == null) return;

    setState(() {
      toDate = pickedTo;
      context.read<CstmrDashboardBloc>().add(
        LoadCstmrDashboardEvent(fromDate: pickedFrom, toDate: toDate!),
      );
    });

    log("FROM: $fromDate");
    log("TO: $toDate");
  }
}
