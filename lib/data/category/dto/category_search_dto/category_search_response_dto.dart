import 'package:g7_comerce_app/domain/category/models/category_byname/categorysearch_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_search_response_dto.g.dart';

/// ✅ DTO for a single category item
@JsonSerializable()
class CategoryModelDto {
  final int? id;
  final String? name;
  final List<String>? images;

  const CategoryModelDto({
    this.id,
    this.name,
    this.images,
  });

  factory CategoryModelDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelDtoToJson(this);

  /// Convert DTO → Domain Model
  CategoryModel toModel() {
    return CategoryModel(
      id: id ?? 0,
      name: name ?? '',
      images: images ?? [],
    );
  }
}

/// ✅ DTO for full API response
@JsonSerializable(explicitToJson: true)
class CategorySearchResponseDto {
  final bool status;
  final int statusCode;
  final String message;
  final List<CategoryModelDto>? data;

  const CategorySearchResponseDto({
    required this.status,
    required this.statusCode,
    required this.message,
    this.data,
  });

  factory CategorySearchResponseDto.fromJson(Map<String, dynamic> json) {
    return CategorySearchResponseDto(
      status: json['status'] ?? false,
      statusCode: json['statusCode'] ?? 500,
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CategoryModelDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => _$CategorySearchResponseDtoToJson(this);

  /// Convert DTO list → Domain model list
  List<CategoryModel> toCategoryList() {
    if (data == null) return [];
    return data!.map((dto) => dto.toModel()).toList();
  }
}
