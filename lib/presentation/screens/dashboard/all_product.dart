import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g7_comerce_app/core/theme/app_colors.dart';
import 'package:g7_comerce_app/core/theme/textstyle.dart';
import 'package:g7_comerce_app/data/dashboard/dtos/sales_orders_dto.dart';
import 'package:g7_comerce_app/domain/dashboard/models/sales_orders_resp_model.dart';
import 'package:g7_comerce_app/presentation/bloc/dashboard/sales_ordes/bloc/sales_orders_bloc.dart';
import 'package:g7_comerce_app/presentation/screens/dashboard/order_view.dart';
import 'package:intl/intl.dart';

class AllProduct extends StatefulWidget {
  
  // final SalesOrdersRespModel? routeName;
  const AllProduct({super.key,});

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  // final List<Map<String, dynamic>> card = [
  //   {'status': 'Processing', 'color': AppColors.skyBlue},
  //   {'status': 'Pending', 'color': AppColors.red},
  //   {'status': 'Delivered', 'color': AppColors.green},
  // ];

  Color statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return AppColors.red;
      case 'processing':
        return AppColors.skyBlue;
      case 'delivered':
        return AppColors.green;
      default:
        return AppColors.grey;
    }
  }

  @override
  void initState() {
    super.initState();

    // context.read<SalesOrdersBloc>().add(
    //   LoadSalesOrdersEvent(
    //     pageNumber: 1,
    //     pageSize: 10,
    //     fromDate: DateTime.now(),
    //     toDate: DateTime.now(),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesOrdersBloc, SalesOrdersState>(
      builder: (context, state) {
        if (state is SalesOrdersBlocInitial) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is SalesOrdersLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is SalesOrdersFailure) {
          return Center(child: Text(state.message));
        }
        if (state is SalesOrdersSuccess) {
          final details = state.salesOrders;

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
            body: details.data.isEmpty
                ? Center(child: Text('No orders Found'))
                : ListView.builder(
                    itemCount: details.data.length,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    itemBuilder: (context, index) {
                      final order = details.data[index];
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OrderView(orderId: order.orderId,),
                                ),
                              );
                            },
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.239,
                              padding: EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.greyWhite,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'order Number',
                                            style: AppTextstyle.small(
                                              fontSize: 12,
                                              fontColor: AppColors.grey,
                                            ),
                                          ),
                                          Text(
                                            // '#978665',
                                            order.orderNo.toString(),

                                            style: AppTextstyle.small(
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,

                                        children: [
                                          Text(
                                            'Status',
                                            style: AppTextstyle.small(
                                              fontColor: AppColors.grey,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            // item['status'],
                                            order.status,
                                            style: AppTextstyle.small(
                                              fontColor: statusColor(
                                                order.status,
                                              ),
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
                                    // 'Mohammed Shafeeque',
                                    order.customerName,
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
                                    // 'Perinthelmanna',
                                    order.routeName.isEmpty
                                        ? '-'
                                        : order.routeName,
                                    style: AppTextstyle.small(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Date',
                                            style: AppTextstyle.small(
                                              fontSize: 12,
                                              fontColor: AppColors.grey,
                                            ),
                                          ),
                                          Text(
                                            // '20-Dec-2025',
                                            DateFormat(
                                              'dd-MM-yyyy',
                                            ).format(order.date),
                                            style: AppTextstyle.small(
                                              fontColor: AppColors.pink,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
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
                                                // '890.00',
                                                order.total.toString(),
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
        return Container(
          color: AppColors.white,
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
