import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g7_comerce_app/core/theme/app_colors.dart';
import 'package:g7_comerce_app/core/theme/asset_resources.dart';
import 'package:g7_comerce_app/core/theme/textstyle.dart';
import 'package:g7_comerce_app/presentation/bloc/dashboard/bloc/cstmr_dashboard_bloc.dart';
import 'package:g7_comerce_app/presentation/screens/dashboard/all_product.dart';

class CustomerDashboard extends StatefulWidget {
  CustomerDashboard({super.key});

  @override
  State<CustomerDashboard> createState() => _CustomerDashboardState();
}

class _CustomerDashboardState extends State<CustomerDashboard> {
  final List<Map<String, dynamic>> gridItems = [
    {'status': 'Accepted', 'image': AssetResources.accepted, 'count': '28'},
    {'status': 'Billed', 'image': AssetResources.billed, 'count': '13'},
    // {'status': 'Processing', 'image': AssetResources.processing, 'count': '17'},
    // {'status': 'Packed', 'image': AssetResources.packed, 'count': '23'},
    // {'status': 'Dispatched', 'image': AssetResources.dispatched, 'count': '54'},
    {'status': 'Delivered', 'image': AssetResources.delivered, 'count': '34'},
  ];

  @override
  void initState() {
    super.initState();

    context.read<CstmrDashboardBloc>().add(
      LoadCstmrDashboardEvent(
        fromDate: DateTime.now().subtract(const Duration(days: 30)),
        toDate: DateTime.now(),
      ),
    );
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
            if (state is cstmrDashboardFailure) {
              return Center(child: Text(state.message));
            }
            if (state is CstmrDashboardSuccess) {
              final dashboard = state.dashboard;

              final gridItems = dashboard.data.map((e) {
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
              }).toList();

              final orderedCount = dashboard.data.fold<int>(
                0,
                (prev, e) => prev + e.totalCount,
              );

              return Column(
                children: [
                  // SizedBox(height: 20),
                  devider,
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
                      itemCount: 3,
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
}
