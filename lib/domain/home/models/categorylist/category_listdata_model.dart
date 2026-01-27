import 'package:equatable/equatable.dart';
import 'package:g7_comerce_app/domain/home/models/section_newarrival/sec_newarrivalpagination_model.dart';
import 'category_item_model.dart';

class CategoryListDataModel extends Equatable {
  final List<CategoryItemModel> categories;

  const CategoryListDataModel({required this.categories, PaginationModel? pagination});

  factory CategoryListDataModel.fromMap(Map<String, dynamic> map) {
    final categoriesJson = map['categories'] as List<dynamic>? ?? [];
    return CategoryListDataModel(
      categories: categoriesJson.map((e) => CategoryItemModel.fromMap(e)).toList(),
    );
  }

  factory CategoryListDataModel.dummy() {
    return const CategoryListDataModel(categories: []);
  }

  @override
  List<Object?> get props => [categories];
}
