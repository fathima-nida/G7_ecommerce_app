// import 'package:flutter/material.dart';
// import 'package:g7_comerce_app/core/theme/app_colors.dart';
// import 'package:g7_comerce_app/core/theme/asset_resources.dart';
// import 'package:g7_comerce_app/core/theme/textstyle.dart';

// class ProductViewPage extends StatefulWidget {
//   const ProductViewPage({super.key});

//   @override
//   State<ProductViewPage> createState() => _ProductViewPageState();
// }

// class _ProductViewPageState extends State<ProductViewPage> {
//   int quantity = 1;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const BackButton(),
//         title: const Text("Product View"),
//         backgroundColor: AppColors.white,
//         foregroundColor: AppColors.black,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Center(
//             //   child: Image.asset(AssetResources.chargerb,fit:BoxFit.cover),
//             // ),

//             // const SizedBox(height: 16),
//             SizedBox(
//               height: 400,
//               child: PageView(
//                 children: [
//                   Image.asset(AssetResources.chargerb, fit: BoxFit.cover),
//                   Image.asset(AssetResources.chargerb, fit: BoxFit.cover),
//                   Image.asset(AssetResources.chargerb, fit: BoxFit.cover),
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                  Text(
//                   "Your resource to discover and \nconnect",
//                   style: AppTextstyle.medium(fontSize: 16),
//                 ),
//                 Row(
//                   children: [
//                     _quantityButton(
//                       icon: Icons.remove,
//                       onPressed: () {
//                         if (quantity > 1) {
//                           setState(() => quantity--);
//                         }
//                       },
//                     ),
//                     const SizedBox(width: 5),
//                     Text(
//                       quantity.toString().padLeft(2, '0'),
//                       style: const TextStyle(fontSize: 16),
//                     ),
//                     const SizedBox(width: 5),
//                     _quantityButton(
//                       icon: Icons.add,
//                       onPressed: () {
//                         setState(() => quantity++);
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//                Text(
//               "₹ 29,999",
//               style: AppTextstyle.large(
                
//                 fontColor: AppColors.green,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 16),
//         Text(
//               "Description",
//               style: AppTextstyle.medium( fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 6),
//              Text(
//               "Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity. It is one of four rhetorical...",
//               style: AppTextstyle.small(fontColor: AppColors.grey,fontWeight: FontWeight.w500),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Row(
//           children: [
//             Expanded(
//               child: ElevatedButton.icon(
//                 onPressed: () {},
//                 icon: const Icon(Icons.shopping_bag),
//                 label: const Text("Add Cart"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.pink,
//                   foregroundColor: AppColors.white,
//                   padding: const EdgeInsets.symmetric(vertical: 14),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(width: 12),

//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(color: AppColors.lighteGrey),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: IconButton(
//                 icon: const Icon(Icons.favorite_border),
//                 onPressed: () {},
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   Widget _quantityButton({
//     required IconData icon,
//     required VoidCallback onPressed,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: AppColors.lighteGrey),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: IconButton(icon: Icon(icon), onPressed: onPressed),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:g7_comerce_app/core/theme/app_colors.dart';
// import 'package:g7_comerce_app/core/theme/textstyle.dart';
// import '../../../data/models/product_model.dart';
// import '../../../data/services/product_api.dart';

// class ProductViewPage extends StatefulWidget {
//   final int productId;
//   const ProductViewPage({super.key, required this.productId});

//   @override
//   State<ProductViewPage> createState() => _ProductViewPageState();
// }

// class _ProductViewPageState extends State<ProductViewPage> {
//   ProductModel? product;
//   bool isLoading = true;
//   int quantity = 1;

//   @override
//   void initState() {
//     super.initState();
//     loadProduct();
//   }

//   Future<void> loadProduct() async {
//     product = await ProductApi.getProduct(widget.productId);
//     setState(() => isLoading = false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return const Scaffold(
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Product View"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [

//             // IMAGES
//             SizedBox(
//               height: 350,
//               child: PageView(
//                 children: product!.images.map((img) {
//                   return Image.network(img, fit: BoxFit.cover);
//                 }).toList(),
//               ),
//             ),

//             const SizedBox(height: 10),

//             // NAME & QUANTITY
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(product!.name, style: AppTextstyle.medium(fontSize: 16)),
//                 Row(
//                   children: [
//                     IconButton(onPressed: () {
//                       if (quantity > 1) setState(() => quantity--);
//                     }, icon: const Icon(Icons.remove)),
//                     Text(quantity.toString()),
//                     IconButton(onPressed: () {
//                       setState(() => quantity++);
//                     }, icon: const Icon(Icons.add)),
//                   ],
//                 ),
//               ],
//             ),

//             // PRICE
//             Text("₹ ${product!.price}",
//                 style: AppTextstyle.large(fontColor: AppColors.green)),

//             const SizedBox(height: 10),

//             // DESCRIPTION
//             Text("Description", style: AppTextstyle.medium(fontWeight: FontWeight.bold)),
//             Text(product!.description,
//                 style: AppTextstyle.small(fontColor: AppColors.grey)),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/product/product_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/product/product_event.dart';
import 'package:g7_comerce_app/presentation/bloc/product/product_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/textstyle.dart';

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
    context.read<ProductBloc>().add(LoadProductEvent(widget.productId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product View")),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProductLoaded) {
            final product = state.product;

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 350,
                    child: PageView(
                      children: product.images
                          .map((img) => Image.network(img, fit: BoxFit.cover))
                          .toList(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(product.name, style: AppTextstyle.medium(fontSize: 16)),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () { if (quantity > 1) setState(() => quantity--); },
                              icon: const Icon(Icons.remove)),
                          Text(quantity.toString()),
                          IconButton(
                              onPressed: () { setState(() => quantity++); },
                              icon: const Icon(Icons.add)),
                        ],
                      )
                    ],
                  ),
                  Text("₹ ${product.price}",
                      style: AppTextstyle.large(fontColor: AppColors.green)),
                  Text(product.description),
                ],
              ),
            );
          }

          return const Center(child: Text("Something went wrong"));
        },
      ),
    );
  }
}
