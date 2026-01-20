import 'package:g7_comerce_app/domain/home/models/categorylist/category_listdata_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'category_item_dto.dart';
import 'pagination_dto.dart';

part 'category_list_response_dto.g.dart';

@JsonSerializable()
class CategoryListResponseDto {
  final PaginationDto? pagination;
  final List<CategoryItemDto>? categories;

  const CategoryListResponseDto({this.pagination, this.categories});

  factory CategoryListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryListResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryListResponseDtoToJson(this);

  CategoryListDataModel toModel() {
    return CategoryListDataModel(
      pagination: pagination?.toModel(),
      categories: categories?.map((e) => e.toModel()).toList() ?? [],
    );
  }
}
