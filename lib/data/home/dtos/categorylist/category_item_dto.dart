import 'package:g7_comerce_app/domain/home/models/categorylist/category_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_item_dto.g.dart';

@JsonSerializable()
class CategoryItemDto {
  final int? id;
  final String? name;
  final List<String>? images;

  const CategoryItemDto({
    this.id,
    this.name,
    this.images,
  });

  factory CategoryItemDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryItemDtoToJson(this);

  CategoryItemModel toModel() {
    return CategoryItemModel(
      id: id ?? 0,
      name: name ?? '',
      images: images ?? [],
    );
  }
}
