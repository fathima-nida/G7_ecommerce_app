import 'package:equatable/equatable.dart';
import 'package:g7_comerce_app/domain/common/common_response_model.dart';

/// ✅ Domain model for a single category
class CategoryModel extends Equatable {
  final int id;
  final String name;
  final List<String> images;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.images,
  });

  @override
  List<Object?> get props => [id, name, images];

  /// Optional: factory from Map (if needed)
  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      images: map['images'] != null
          ? List<String>.from(map['images'])
          : [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'images': images,
    };
  }
}

/// ✅ Domain model for API response
class CategorySearchResponseModel {
  final CommonResponseModel common;
  final List<CategoryModel> data;

  CategorySearchResponseModel({
    required this.common,
    required this.data,
  });
}
