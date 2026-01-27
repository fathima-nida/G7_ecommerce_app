import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g7_comerce_app/core/theme/app_colors.dart';
import 'package:g7_comerce_app/core/theme/asset_resources.dart';
import 'package:g7_comerce_app/core/theme/textstyle.dart';
import 'package:g7_comerce_app/domain/auth/models/otp_response_model.dart';
import 'package:g7_comerce_app/domain/cart/model/cart_response.dart';
import 'package:g7_comerce_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/auth/auth_state.dart';
import 'package:g7_comerce_app/presentation/bloc/cart/bloc/cart_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/cart/bloc/cart_event.dart';
import 'package:g7_comerce_app/presentation/bloc/cart/bloc/cart_state.dart';
import 'package:g7_comerce_app/presentation/bloc/home/banner/banner_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/home/banner/banner_event.dart';
import 'package:g7_comerce_app/presentation/bloc/home/banner/banner_state.dart';
import 'package:g7_comerce_app/presentation/bloc/home/categorylist/category_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/home/sec_newarrival/section_newarrival_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/home/sec_newarrival/section_newarrival_event.dart';
import 'package:g7_comerce_app/presentation/bloc/home/sec_newarrival/section_newarrival_state.dart';
import 'package:g7_comerce_app/presentation/screens/cart/cartlists.dart';
import 'package:g7_comerce_app/presentation/screens/home/searchscreen.dart';
import 'package:g7_comerce_app/presentation/screens/home/widgets/dots.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late final PageController _bannerController;
  late final PageController _banner2Controller;
  @override
  void initState() {
    super.initState();
    _bannerController = PageController();
    _banner2Controller = PageController();

    context.read<BannerBloc>().add(const FetchBannerEvent());
    context.read<SecNewarrivalBloc>().add(const FetchNewArrivalEvent());
    context.read<CategoryBloc>().add(const FetchCategoryEvent());
    context.read<CartBloc>().add(LoadCart());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    OtpResponseModel? user;
                    if (state is OtpVerifySuccess) {
                      user = state.user;
                    } else if (state is AuthLoggedIn) {
                      user = state.user;
                    }

                    return Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              (user?.profileImage.isNotEmpty == true)
                              ? NetworkImage(user!.profileImage)
                              : const AssetImage(AssetResources.profile)
                                    as ImageProvider,
                        ),

                        const SizedBox(width: 5),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user?.ledgerName ?? "Guest User",
                                style: AppTextstyle.medium(fontSize: 15),
                              ),
                              Text(
                                user?.role ?? "",
                                style: AppTextstyle.small(
                                  fontSize: 13,
                                  fontColor: AppColors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 8),
                              decoration: const BoxDecoration(
                                color: AppColors.lytwhite,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => Searchscreen(),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.search_outlined,
                                  size: 20,
                                  color: AppColors.grey,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 8),
                              decoration: const BoxDecoration(
                                color: AppColors.lytwhite,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.notifications_outlined,
                                  size: 20,
                                  color: AppColors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return const SizedBox(
                      height: 110,
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is CategoryLoaded) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: state.categories.map((cat) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      style: BorderStyle.none,
                                      color: AppColors.bluegrey,
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.lytwhite,
                                    radius: 35,
                                    backgroundImage:
                                        NetworkImage(
                                              cat.images.isNotEmpty
                                                  ? cat.images.first
                                                  : AssetResources.charger3,
                                            )
                                            as ImageProvider,
                                    onBackgroundImageError: (_, __) {
                                      log(
                                        "Failed to load category image: ${cat.name}",
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 5, width: 70),
                                Text(cat.name, style: AppTextstyle.small()),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }
                  if (state is CategoryError) {
                    return SizedBox(
                      height: 110,
                      child: Center(child: Text(state.message)),
                    );
                  }
                  return const SizedBox();
                },
              ),

              const SizedBox(height: 13),

              BlocBuilder<BannerBloc, BannerState>(
                builder: (context, state) {
                  if (state is BannerLoading) {
                    return const SizedBox(
                      height: 180,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  if (state is BannerLoaded) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 180,
                          child: PageView.builder(
                            controller: _bannerController,
                            itemCount: state.banner1Images.length,
                            itemBuilder: (context, index) {
                              return Image.network(
                                state.banner1Images[index],
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        DotsIndicator(
                          itemCount: state.banner1Images.length,
                          controller: _bannerController,
                        ),
                      ],
                    );
                  }
                  if (state is BannerError) {
                    return const SizedBox(height: 180);
                  }
                  return SizedBox(height: 180);
                },
              ),
              const SizedBox(height: 15),

              Text("New Arrival", style: AppTextstyle.large(fontSize: 19)),
              const SizedBox(height: 15),
              BlocBuilder<SecNewarrivalBloc, SecNewArrivalState>(
                builder: (context, state) {
                  if (state is SecNewArrivalLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SecNewArrivalFailure) {
                    return Center(
                      child: Column(
                        children: [
                          Text(state.message, style: AppTextstyle.medium()),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () => context
                                .read<SecNewarrivalBloc>()
                                .add(const FetchNewArrivalEvent()),
                            child: const Text("Retry"),
                          ),
                        ],
                      ),
                    );
                  } else if (state is SecNewArrivalSuccess) {
                    final items = state.items;
                    if (items.isEmpty) {
                      return Center(
                        child: Text(
                          "No New Arrival items found",
                          style: AppTextstyle.medium(),
                        ),
                      );
                    }
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 1,
                            crossAxisSpacing: 2,
                            childAspectRatio: 0.7,
                          ),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return Container(
                          color: AppColors.warmwhite,
                          child: Column(
                            children: [
                              InkWell(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Image.asset(
                                    AssetResources.favicon,
                                    scale: 22,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: item.images.isNotEmpty
                                    ? Image.network(
                                        item.images.first,
                                        fit: BoxFit.contain,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Image.asset(
                                                  AssetResources.headset,
                                                ),
                                      )
                                    : Image.asset(AssetResources.headset),
                              ),
                              Text(
                                item.name.isNotEmpty
                                    ? item.name
                                    : "Unnamed product",
                                style: AppTextstyle.small(
                                  fontColor: AppColors.bluegrey,
                                ),
                              ),
                              Text(
                                item.mrp > 0
                                    ? "₹ ${item.mrp}"
                                    : "Price not available",
                                style: AppTextstyle.medium(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 4),
                              // BlocBuilder<CartBloc, CartState>(
                              //   builder: (context, state) {
                              //     CartProductModel?cartProduct;
                              //     if(CartState is CartLoaded ){
                              //       try{
                              //         cartProduct=CartState.cartResponse.products.firstWhere((p)=>p.id==item.id);
                              //       }catch(_){cartProduct =null;}

                              //     }
                              //     final bool isInCart=cartProduct!=null;
                              //     return InkWell(
                              //       onTap: () {
                              //         if(isInCart){context.read<CartBloc>().add(RemoveFromCart(cartProduct!.cartItemId));
                              //         }else{
                              //           context.read<CartBloc>().add(Add)
                              //         }
                              //       },
                              //       child: Container(
                              //         height: 20,
                              //         width: 100,
                              //         decoration: BoxDecoration(
                              //           borderRadius: BorderRadius.circular(6),
                              //           color: AppColors.Opacitygreencolor,
                              //         ),
                              //         child: Row(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.spaceEvenly,
                              //           children: [
                              //             Image.asset(AssetResources.bag),

                              //             Text(
                              //               "Add Cart",
                              //               style: AppTextstyle.small(
                              //                 fontColor: AppColors.green,
                              //               ),
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //     );
                              //   },
                              // ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                  return const SizedBox();
                },
              ),
              const SizedBox(height: 15),

              BlocBuilder<BannerBloc, BannerState>(
                builder: (context, state) {
                  if (state is BannerLoading) {
                    return const SizedBox(
                      height: 180,
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is BannerLoaded) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 180,
                          child: PageView.builder(
                            controller: _banner2Controller,
                            itemCount: state.banner2Images.length,
                            itemBuilder: (context, index) {
                              return Image.network(
                                state.banner2Images[index],
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        DotsIndicator(
                          itemCount: state.banner2Images.length,
                          controller: _banner2Controller,
                        ),
                      ],
                    );
                  }
                  if (state is BannerError) {
                    return const SizedBox(height: 180);
                  }
                  return SizedBox(height: 180);
                },
              ),
              const SizedBox(height: 15),

              // ===== Offer Zone =====
              Text("Offer Zone", style: AppTextstyle.large(fontSize: 19)),
              const SizedBox(height: 15),
              BlocBuilder<SecNewarrivalBloc, SecNewArrivalState>(
                builder: (context, state) {
                  if (state is SecNewArrivalLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SecNewArrivalFailure) {
                    return Center(
                      child: Column(
                        children: [
                          Text(state.message, style: AppTextstyle.medium()),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () => context
                                .read<SecNewarrivalBloc>()
                                .add(FetchNewArrivalEvent()),
                            child: Text("Retry"),
                          ),
                        ],
                      ),
                    );
                  } else if (state is SecNewArrivalSuccess) {
                    final items = state.items;
                    if (items.isEmpty) {
                      return Center(
                        child: Text(
                          "No offerzone items",
                          style: AppTextstyle.medium(),
                        ),
                      );
                    }
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 1,
                            crossAxisSpacing: 2,
                            childAspectRatio: 0.7,
                          ),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];

                        return Container(
                          color: AppColors.warmwhite,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Image.asset(
                                  AssetResources.favicon,
                                  scale: 22,
                                ),
                              ),
                              Expanded(
                                child: item.images.isNotEmpty
                                    ? Image.network(
                                        item.images.first,
                                        fit: BoxFit.contain,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Image.asset(
                                                  AssetResources.headset,
                                                ),
                                      )
                                    : Image.asset(AssetResources.headset),
                              ),
                              Text(item.name),
                              const SizedBox(height: 5),
                              Text(
                                item.mrp > 0
                                    ? "₹ ${item.mrp}"
                                    : "Price not available",
                                style: AppTextstyle.medium(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),

                              SizedBox(height: 4),

                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CartScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 20,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: AppColors.Opacitygreencolor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(AssetResources.bag),

                                      Text(
                                        "Add Cart",
                                        style: AppTextstyle.small(
                                          fontColor: AppColors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 2),
                            ],
                          ),
                        );
                      },
                    );
                  }

                  return SizedBox();
                },
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
