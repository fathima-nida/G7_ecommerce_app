import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g7_comerce_app/core/theme/app_colors.dart';
import 'package:g7_comerce_app/core/theme/asset_resources.dart';
import 'package:g7_comerce_app/core/theme/textstyle.dart';
import 'package:g7_comerce_app/domain/favourite/model/favourite_load/favourite_item_response.dart';
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
      backgroundColor: AppColors.black,
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
  body: BlocConsumer<FavouriteBloc, FavouriteState>(
    listener: (context, state) {
      if (state is FavouriteActionSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.message)),
        );
      }
    },
    builder: (context, state) {
      if (state is FavouriteLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      if (state is FavouriteFailure) {
        return Center(child: Text(state.message));
      }

      final productsToShow = (state is FavouriteSuccess)
          ? state.success.products
          : [];

      if (productsToShow.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AssetResources.headphone, width: 120),
              const SizedBox(height: 10),
              const Text("Your wishlist is empty"),
            ],
          ),
        );
      }

      return ListView.builder(
        itemCount: productsToShow.length,
        itemBuilder: (context, index) {
          final item = productsToShow[index];

          return Container(
            key: ValueKey('${item.irId}_${item.imageUrl}'),
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: AppColors.containercolor,
            ),
            child: Row(
              children: [
                //////
              Image.asset(
  item.imageUrl,
  width: 90,
  height: 90,
  fit: BoxFit.cover,
),


                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item.productName,maxLines: 1,overflow: TextOverflow.ellipsis,),
                          InkWell(
                            onTap: () {
                              context.read<FavouriteBloc>().add(
                                RemoveFavouriteEvent(item.irId),
                              );
                            },
                            child: const Icon(Icons.close, color: AppColors.red),
                          ),
                        ],
                      ),
                      Text("₹${item.price}",
                      style: AppTextstyle.medium(
                                fontWeight: FontWeight.w600,
                              ),
                      ), 
                         const SizedBox(height: 8),
                          InkWell(
                              onTap: () => _openDescriptionSheet(context),
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: 34,
                                width: 110,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.opacitygreenColor,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AssetResources.bag,
                                      color: AppColors.greenlight,
                                      width: 18,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      "Add Cart",
                                      style: AppTextstyle.small(
                                        fontColor:
                                            AppColors.greenlight,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),          
                    ],
                  ),
                )
              ],
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
  Widget _buildImage(String url) {
    if (url.isEmpty) {
      return _placeholderImage();
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        url,
        width: 90,
        height: 90,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _placeholderImage(),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const SizedBox(
            width: 90,
            height: 90,
            child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
          );
        },
      ),
    );
  }

  Widget _placeholderImage() {
    return Container(
      width: 90,
      height: 90,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(Icons.image, size: 32),
    );
  }
}
