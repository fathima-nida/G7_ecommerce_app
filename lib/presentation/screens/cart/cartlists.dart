import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g7_comerce_app/core/theme/app_colors.dart';
import 'package:g7_comerce_app/core/theme/asset_resources.dart';
import 'package:g7_comerce_app/core/theme/textstyle.dart';
import 'package:g7_comerce_app/data/cart/cart_implementation/cart_implementation.dart';
import 'package:g7_comerce_app/presentation/bloc/cart/bloc/cart_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/cart/bloc/cart_event.dart';
import 'package:g7_comerce_app/presentation/bloc/cart/bloc/cart_state.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    context.read<CartBloc>().add(LoadCart());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                /// CART LIST
                Expanded(
                  child: BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if (state is CartLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state is CartLoaded) {
                        final products = state.cartResponse.products;

                        if (products.isEmpty) {
                          return const Center(
                            child: Text("Your cart is empty"),
                          );
                        }

                        return ListView.builder(
                          itemCount: products.length,
                          itemBuilder: (_, index) {
                            final item = products[index];

                            return Container(
                              height: 154,
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppColors.warmwhite,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.15),
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(AssetResources.headset, scale: 9),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.name,
                                          style: AppTextstyle.small(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.currency_rupee_rounded,
                                              size: 16,
                                            ),
                                            Text(item.price.toString()),
                                          ],
                                        ),
                                        const SizedBox(height: 6),
                                        Container(
                                          height: 46,
                                          width: width / 1.5,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                          ),
                                          decoration: BoxDecoration(
                                            color: AppColors.lytwhite,
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  item.description ?? "",
                                                  style: AppTextstyle.small(
                                                    fontWeight: FontWeight.w500,
                                                    fontColor:
                                                        AppColors.bluegrey,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              Image.asset(
                                                AssetResources.boxcart,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 6),

                                        /// QUANTITY & REMOVE
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                _qtyButton(
                                                  icon: Icons.remove,
                                                  onTap: () {
                                                    context
                                                        .read<CartBloc>()
                                                        .add(
                                                          DecreaseQuantity(
                                                            item.cartItemId,
                                                          ),
                                                        );
                                                  },
                                                ),
                                                const SizedBox(width: 12),
                                                Text(item.qty.toString()),
                                                const SizedBox(width: 12),
                                                _qtyButton(
                                                  icon: Icons.add,
                                                  onTap: () {
                                                    context
                                                        .read<CartBloc>()
                                                        .add(
                                                          IncreaseQuantity(
                                                            item.cartItemId,
                                                          ),
                                                        );
                                                  },
                                                ),
                                              ],
                                            ),
                                            InkWell(
                                              onTap: () {
                                                context.read<CartBloc>().add(
                                                  RemoveFromCart(
                                                    item.cartItemId,
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                height: 34,
                                                width: 94,
                                                decoration: BoxDecoration(
                                                  color: AppColors
                                                      .opacitypinkcolor,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Remove",
                                                    style: AppTextstyle.small(
                                                      fontColor: AppColors.pink,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }

                      if (state is CartError) {
                        return Center(child: Text(state.message));
                      }

                      return const SizedBox();
                    },
                  ),
                ),

                /// TOTAL
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    if (state is CartLoaded) {
                      final total = state.cartResponse.products.fold(
                        0.0,
                        (sum, item) => sum + (item.price * item.qty),
                      );

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: AppTextstyle.large(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "₹ $total",
                            style: AppTextstyle.large(
                              fontWeight: FontWeight.w600,
                              fontColor: Colors.green,
                            ),
                          ),
                        ],
                      );
                    }
                    return const SizedBox();
                  },
                ),

                const SizedBox(height: 10),

                /// CHECKOUT
                Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.pink,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      "Checkout",
                      style: AppTextstyle.medium(fontColor: AppColors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _qtyButton({required IconData icon, required VoidCallback onTap}) {
    return Container(
      height: 34,
      width: 34,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(onTap: onTap, child: Icon(icon)),
    );
  }
}
