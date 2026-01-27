

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g7_comerce_app/core/theme/app_colors.dart';
import 'package:g7_comerce_app/core/theme/asset_resources.dart';
import 'package:g7_comerce_app/core/theme/textstyle.dart';
import 'package:g7_comerce_app/domain/home/models/search_req_model.dart';
import 'package:g7_comerce_app/presentation/bloc/home/sec_newarrival/search_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/home/sec_newarrival/search_event.dart';
import 'package:g7_comerce_app/presentation/bloc/home/sec_newarrival/search_state.dart';
// import 'package:g7_comerce_app/presentation/bloc/search/search_bloc.dart';
// import 'package:g7_comerce_app/presentation/bloc/search/search_event.dart';
// import 'package:g7_comerce_app/presentation/bloc/search/search_state.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  final TextEditingController _searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();

    /// Initial API call
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, color: AppColors.black),
        ),
        title: Text(
          "Search Product",
          style: AppTextstyle.medium(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// 🔍 SEARCH BAR
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: AppColors.lytwhite,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: AppColors.grey),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: _searchCtrl,
                            decoration: const InputDecoration(
                              hintText: "Search Products",
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {
                              if (value.isEmpty) {
                                return;
                              }

                              context.read<SearchBloc>().add(
                                SearchProductsEvent(SearchReqModel(
                                  name: value,
                                ))
                                
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: AppColors.lytwhite,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Image.asset(
                      AssetResources.filter,
                      width: 22,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// 🛍 PRODUCT LIST (BLOC)
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is SearchFailure) {
                    return Center(
                      child: Text(state.message),
                    );
                  }

                  if (state is SearchSuccess) {
                    final products = state.data.data;

                    if (products.isEmpty) {
                      return const Center(
                        child: Text("No products found"),
                      );
                    }

                    return ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.warmwhite,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// IMAGE
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Image.network(
                                    product.images.isNotEmpty ? product.images.first : "",
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        AssetResources.chargerb,
                                        fit: BoxFit.contain,
                                      );
                               
                                    }
                                    //     Image.asset(
                                    //   AssetResources.chargerb,
                                    // ),
                                  ),
                                ),

                                const SizedBox(width: 12),

                                /// TEXT
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.name,
                                        style: AppTextstyle.medium(
                                          fontColor: AppColors.grey,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        "₹ ${product.mrp}",
                                        style: AppTextstyle.large(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 8),

                                      /// ADD CART
                                      Container(
                                        height: 33,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.green
                                              .withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(
                                              AssetResources.bag,
                                              width: 18,
                                              height: 18,
                                            ),
                                            const SizedBox(width: 6),
                                            Text(
                                              "Add Cart",
                                              style: AppTextstyle.small(
                                                fontColor: AppColors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                /// FAVORITE
                                Image.asset(
                                  AssetResources.favorite,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
