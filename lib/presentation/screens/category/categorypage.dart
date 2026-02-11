import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g7_comerce_app/core/theme/app_colors.dart';
import 'package:g7_comerce_app/core/theme/asset_resources.dart';
import 'package:g7_comerce_app/core/theme/textstyle.dart';
import 'package:g7_comerce_app/domain/category/models/category_byname/categoryname_req_model.dart';
import 'package:g7_comerce_app/presentation/bloc/category/category_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/category/category_event.dart';
import 'package:g7_comerce_app/presentation/bloc/category/category_state.dart';
import 'package:g7_comerce_app/presentation/screens/category/chargerlist.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final List<Map<String, dynamic>> categoryList = [
    {'image': AssetResources.chargerb, 'text': 'Charger'},
    {'image': AssetResources.backcovers, 'text': 'Back Covers'},
    {'image': AssetResources.screenguard, 'text': 'Screen Guards'},
    {'image': AssetResources.mobilestand, 'text': 'Mobile Stands'},
  ];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔍 SEARCH BAR
            Container(
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.lighteGrey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                onSubmitted: (value) {
                  if(value.isNotEmpty){
                  final request = CategorySearchRequestModel(name: value);
                  context
                      .read<CategorySearchBloc>()
                      .add(FetchCategoriesByName(request));
                  }
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.search, size: 20, color: Colors.grey),
                  hintText: 'Search categories',
                  hintStyle: AppTextstyle.small(fontColor: AppColors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 📦 GRID VIEW
            Expanded(
              child: BlocBuilder<CategorySearchBloc, CategorySearchState>(
                builder: (context, state) {
                  if (state is CategorySearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CategorySearchError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: AppTextstyle.small(fontColor: AppColors.red),
                      ),
                    );
                  } else if (state is CategorySearchLoaded) {
                    final categories = state.response.data;

                    if (categories.isEmpty) {
                      return Center(
                        child: Text(
                          "No categories found",
                          style: AppTextstyle.small(fontColor: AppColors.grey),
                        ),
                      );
                    }

                    return GridView.builder(
                      itemCount: categories.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 184 / 111,
                      ),
                      itemBuilder: (context, index) {
                        final data = categories[index];

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Chargerlistscreen(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.lighteGrey.withOpacity(0.6),
                              ),
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (data.images.isNotEmpty)
                                  Image.network(
                                    data.images.first,
                                    height: 40,
                                    errorBuilder: (_, __, ___) => const Icon(
                                        Icons.broken_image_outlined),
                                  ),
                                const SizedBox(height: 6),
                                Text(
                                  data.name,
                                  style: AppTextstyle.small(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    fontColor: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }

                  // Initial state fallback
                  return GridView.builder(
                    itemCount: categoryList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 184 / 111,
                    ),
                    itemBuilder: (context, index) {
                      final data = categoryList[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => Chargerlistscreen(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.lighteGrey.withOpacity(0.6),
                            ),
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(data['image'], height: 40),
                              const SizedBox(height: 6),
                              Text(
                                data['text'],
                                style: AppTextstyle.small(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontColor: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
