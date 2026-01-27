import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g7_comerce_app/core/theme/app_colors.dart';
import 'package:g7_comerce_app/core/theme/textstyle.dart';
import 'package:g7_comerce_app/presentation/bloc/product/product_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/product/product_event.dart';
import 'package:g7_comerce_app/presentation/bloc/product/product_state.dart';

class ProductViewPage extends StatefulWidget {
  final int productId;
  const ProductViewPage({super.key, required this.productId});

  @override
  State<ProductViewPage> createState() => _ProductViewPageState();
}

class _ProductViewPageState extends State<ProductViewPage> {
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    context.read<ProductDetailsBloc>().add(
          LoadProductDetailsEvent(productId: 955),
        );
  }

  Widget _quantityButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      height: 28,
      width: 28,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lighteGrey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        icon: Icon(icon,size: 16,), onPressed: onPressed), 
    //     padding: EdgeInsets.zero,
    // constraints: const BoxConstraints(),
    // alignment: Alignment.center,

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Product View"),
        foregroundColor: AppColors.black,
        elevation: 0,
      ),
      body: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          if (state is ProductDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProductDetailsFailure) {
            return Center(child: Text(state.message));
          }

          if (state is ProductDetailsSuccess) {
            final product = state.product.data;

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 400,
                    child: PageView(
                      children: product.images
                          .map((img) => Image.network(img, fit: BoxFit.cover))
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: AppTextstyle.small(fontSize: 12),
                      ),
                      Row(
                        children: [
                          _quantityButton(
                            icon: Icons.remove,
                            onPressed: () {
                              if (quantity > 1) setState(() => quantity--);
                            },
                          ),
                          const SizedBox(width: 3),
                          Text(
                            quantity.toString().padLeft(2, '0'),
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(width: 3),
                          _quantityButton(
                            icon: Icons.add,
                            onPressed: () {
                              setState(() => quantity++);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "₹ ${product.mrp}",
                    style: AppTextstyle.large(
                      fontColor: AppColors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Description",
                    style: AppTextstyle.medium(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    product.description,
                    style: AppTextstyle.small(
                      fontColor: AppColors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.shopping_bag),
                label: const Text("Add Cart"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.pink,
                  foregroundColor: AppColors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.lighteGrey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
