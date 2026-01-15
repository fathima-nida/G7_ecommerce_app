import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g7_comerce_app/core/theme/app_colors.dart';
import 'package:g7_comerce_app/core/theme/asset_resources.dart';
import 'package:g7_comerce_app/core/theme/textstyle.dart';
import 'package:g7_comerce_app/domain/home/repository/sec_newarrival_repository.dart';
import 'package:g7_comerce_app/presentation/bloc/home/bloc/section_newarrival_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/home/bloc/section_newarrival_event.dart';
import 'package:g7_comerce_app/presentation/bloc/home/bloc/section_newarrival_state.dart';
import 'package:g7_comerce_app/presentation/screens/home/searchscreen.dart';
import 'package:g7_comerce_app/presentation/screens/home/widgets/carousal.dart';

class Homescreen extends StatelessWidget {
  final List<String> imagelist = [
    AssetResources.headset,
    AssetResources.backcovers,
    AssetResources.screenguard,
    AssetResources.headset,
    AssetResources.backcovers,
    AssetResources.screenguard,
  ];

  final List<String> nameList = [
    "Headset",
    "Back Cover",
    "Screenguard",
    "Headset",
    "Back Cover",
    "Screenguard",
  ];

  final List<String> ad = [AssetResources.ad1, AssetResources.ad1];
  final List<String> ad2 = [AssetResources.ad2, AssetResources.ad2];

  final SecNewarrivalRepository repository;

  Homescreen({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          SecNewarrivalBloc(repository)..add(const FetchNewArrivalEvent()),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeader(context),
                const SizedBox(height: 20),
                buildCategories(),
                const SizedBox(height: 13),
                Carousal(image: ad),
                const SizedBox(height: 15),
                buildNewArrivalSection(),
                const SizedBox(height: 15),
                Carousal(image: ad2),
                const SizedBox(height: 15),
                buildOfferZone(),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Header with profile, search, and notifications
  Widget buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage(AssetResources.profile),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ahmed Raza",
                  style: AppTextstyle.medium(fontSize: 15),
                ),
                Text(
                  "ahmedraza@gmail.com",
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
              iconButton(
                icon: Icons.search_outlined,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Searchscreen(),
                    ),
                  );
                },
              ),
              iconButton(icon: Icons.notifications_outlined, onTap: () {}),
            ],
          )
        ],
      ),
    );
  }

  Widget iconButton({required IconData icon, required VoidCallback onTap}) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      decoration: const BoxDecoration(
        color: AppColors.lytwhite,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icon, size: 20, color: AppColors.grey),
      ),
    );
  }

  /// Horizontal category list
  Widget buildCategories() {
    final categories = [
      {'image': AssetResources.chargers, 'name': 'Charges'},
      {'image': AssetResources.mobilestand, 'name': 'Mobile Stands'},
      {'image': AssetResources.headset, 'name': 'Headsets'},
      {'image': AssetResources.backcovers, 'name': 'Back Cover'},
      {'image': AssetResources.screenguard, 'name': 'Screen Guards'},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((cat) {
          return Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.lytwhite,
                  backgroundImage: AssetImage(cat['image']!),
                  radius: 35,
                ),
                Text(
                  cat['name']!,
                  style: AppTextstyle.small(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  /// New Arrival section using Bloc
  Widget buildNewArrivalSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                          child: Image.asset(AssetResources.favorite, scale: 1),
                        ),
                        Expanded(
                          child: item.images.isNotEmpty
                              ? Image.network(
                                  item.images.first,
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Image.asset(AssetResources.headset),
                                )
                              : Image.asset(AssetResources.headset),
                        ),
                        Text(
                          item.name.isNotEmpty ? item.name : "Unnamed product",
                          style: AppTextstyle.small(
                              fontColor: AppColors.bluegrey),
                        ),
                        Text(
                          item.mrp > 0 ? "₹ ${item.mrp}" : "Price not available",
                          style: AppTextstyle.medium(
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  );
                },
              );
            }

            return const SizedBox();
          },
        ),
      ],
    );
  }

  /// Offer Zone section (static for now)
  Widget buildOfferZone() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Offer Zone", style: AppTextstyle.large(fontSize: 19)),
        const SizedBox(height: 15),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 1,
            crossAxisSpacing: 2,
            childAspectRatio: 0.7,
          ),
          itemCount: imagelist.length,
          itemBuilder: (context, index) {
            return Container(
              color: AppColors.warmwhite,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(AssetResources.favorite, scale: 1),
                  ),
                  Expanded(child: Image.asset(imagelist[index])),
                  Text(
                    nameList[index],
                    style: AppTextstyle.small(fontColor: AppColors.bluegrey),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "₹ 25,000",
                    style: AppTextstyle.medium(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10),
                  buildAddRemoveButton(index),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget buildAddRemoveButton(int index) {
    final isRemove = index == 2 || index == 5;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: isRemove
              ? AppColors.opacitypinkcolor
              : AppColors.Opacitygreencolor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AssetResources.bag,
              color: isRemove ? AppColors.pink : AppColors.green,
            ),
            const SizedBox(width: 5),
            Text(
              isRemove ? "Remove" : "Add Cart",
              style: AppTextstyle.small(
                fontColor: isRemove ? AppColors.pink : AppColors.green,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}





