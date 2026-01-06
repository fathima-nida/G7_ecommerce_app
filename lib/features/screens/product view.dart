import 'package:flutter/material.dart';
import 'package:g7_comerce_app/core/theme/app_colors.dart';
import 'package:g7_comerce_app/core/theme/asset_resources.dart';
import 'package:g7_comerce_app/core/theme/textstyle.dart';

class ProductViewPage extends StatefulWidget {
  const ProductViewPage({super.key});

  @override
  State<ProductViewPage> createState() => _ProductViewPageState();
}

class _ProductViewPageState extends State<ProductViewPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Product View"),
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Center(
            //   child: Image.asset(AssetResources.chargerb,fit:BoxFit.cover),
            // ),

            // const SizedBox(height: 16),
            SizedBox(
              height: 400,
              child: PageView(
                children: [
                  Image.asset(AssetResources.chargerb, fit: BoxFit.cover),
                  Image.asset(AssetResources.chargerb, fit: BoxFit.cover),
                  Image.asset(AssetResources.chargerb, fit: BoxFit.cover),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  "Your resource to discover and \nconnect",
                  style: AppTextstyle.medium(fontSize: 16),
                ),

                /// Quantity Controller
                Row(
                  children: [
                    _quantityButton(
                      icon: Icons.remove,
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() => quantity--);
                        }
                      },
                    ),

                    const SizedBox(width: 5),

                    Text(
                      quantity.toString().padLeft(2, '0'),
                      style: const TextStyle(fontSize: 16),
                    ),

                    const SizedBox(width: 5),

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
              "₹ 29,999",
              style: AppTextstyle.large(
                
                fontColor: AppColors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
        Text(
              "Description",
              style: AppTextstyle.medium( fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 6),

             Text(
              "Description is any type of communication that aims to make vivid a place, object, person, group, or other physical entity. It is one of four rhetorical...",
              style: AppTextstyle.small(fontColor: AppColors.grey,fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),

      /// Bottom Bar
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

  /// Reusable quantity button
  Widget _quantityButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lighteGrey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(icon: Icon(icon), onPressed: onPressed),
    );
  }
}
