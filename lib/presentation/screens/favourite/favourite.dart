
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g7_comerce_app/core/theme/app_colors.dart';
import 'package:g7_comerce_app/core/theme/asset_resources.dart';
import 'package:g7_comerce_app/core/theme/textstyle.dart';
import 'package:g7_comerce_app/domain/favourite/model/favourite_item_response.dart';
import 'package:g7_comerce_app/presentation/bloc/favourite/favourite_bloc.dart';
import 'favouriealert.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  void initState() {
    super.initState();
    context.read<FavouriteBloc>().add(LoadFavouriteEvent(page: 1, pageSize: 10));
  }

  Future<void> _openDescriptionSheet(BuildContext context) async {
    final result = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const DescriptionBottomSheet(),
    );

    if (result != null && result.isNotEmpty) {
      debugPrint("User description: $result");
    }
  }

  final List<WishlistProductModel> callbackProducts = [
  WishlistProductModel(
    productName: "Resource to discover and connect",price: 29999,imageUrl: AssetResources.charger,irId: 0,irName: "",irMrp: 0,stock: true,
    images: [AssetResources.charger],
  ),
  WishlistProductModel(
   
    productName: "Resource to discover and connect",price: 29999,imageUrl: AssetResources.charger,irId: 0,irName: "",irMrp: 0,stock: true,
    images: [AssetResources.headset],
  ),
  WishlistProductModel(
    productName: "Resource to discover and connect",price: 29999,imageUrl: AssetResources.charger,irId: 0,irName: "",irMrp: 0,stock: true,
    images: [AssetResources.screencard],
  ),
WishlistProductModel( 
    productName: "Resource to discover and connect",price: 29999,imageUrl: AssetResources.charger,irId: 0,irName: "",irMrp: 0,stock: true,
    images: [AssetResources.phonecase]
),
WishlistProductModel( 
    productName: "Resource to discover and connect",price: 29999,imageUrl: AssetResources.charger,irId: 0,irName: "",irMrp: 0,stock: true,
    images: [AssetResources.phonecase]
),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
          if (state is FavouriteLoading) {
            return const Center(child: CircularProgressIndicator());
          }
        if (state is FavouriteFailure) {
      return Center(child: Text(state.message));
    }
    final productsToShow = (state is FavouriteSuccess)
    ? state.success.products:[];
if (productsToShow.isEmpty){
  return Center(
    child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AssetResources.headphone,width: 120,height: 120, ),
        const SizedBox(height: 10),
        Text("your wishlist is empty",style: TextStyle(fontSize: 16, color:Colors.grey),

        )
      ],
    )
  );
}
          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: productsToShow.length,
            itemBuilder: (context, index) {
              final WishlistProductModel item =productsToShow[index];
            final String imageUrl = item.imageUrl.isNotEmpty
            ? item.imageUrl
            : (item.images.isNotEmpty ? item.images.first : '');
   final String titleText = item.productName;
   final String priceText =   "₹${item.price.toStringAsFixed(0)}";
    final int qty = 1;
   
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                 // height: 150,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: AppColors.containercolor,
                  ),
                   child: Row(
          children: [
            ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child:Image.asset(imageUrl,width: 100,height: 100,fit: BoxFit.cover,),
                        
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    titleText,
                                    style: AppTextstyle.small(
                                      fontWeight: FontWeight.w500,
                                      fontColor: AppColors.grey,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Icon(Icons.close, color: AppColors.pink),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                              priceText,
                              style: AppTextstyle.medium(fontWeight: FontWeight.w700),
                            ),
                            //const Spacer(),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    _buildQuantityButton(Icons.remove),
                                    const SizedBox(width: 12),
                                    Text(
                                     qty.toString().padLeft(2, '0'),
                                      style: AppTextstyle.small(fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(width: 12),
                                    _buildQuantityButton(Icons.add),
                                  ],
                                ),
                                InkWell(
                                  onTap: () => _openDescriptionSheet(context),
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: 34,
                                    width: 104,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.opacitygreenColor,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(AssetResources.bag, color: AppColors.greenlight),
                                        const SizedBox(width: 6),
                                        Text(
                                          "Add Cart",
                                          style: AppTextstyle.small(
                                            fontColor: AppColors.greenlight,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildQuantityButton(IconData icon) {
    return Container(
      height: 34,
      width: 34,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {},
        child: Icon(icon),
      ),
    );
  }
  
  Widget _placeholderImage() {
    
    return Container(
      width: 100,
      height: 100,
      color: Colors.grey[300],
      child: const Icon(Icons.image, size: 40),
    );
  }
}
