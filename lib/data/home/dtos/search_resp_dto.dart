import 'package:g7_comerce_app/domain/home/models/search_resp_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_resp_dto.g.dart'; // ✅ must match file name

@JsonSerializable()
class ProductRespDto {
  @JsonKey(name: "data")
  final List<ProductItemDto>? data;

  const ProductRespDto({
    this.data,
  });

  factory ProductRespDto.fromJson(Map<String, dynamic> json) =>
      _$ProductRespDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductRespDtoToJson(this);

  /// DTO ➜ Domain Model
  ProductRespModel toModel() {
    return ProductRespModel(
      data: (data ?? []).map((e) => e.toModel()).toList(),
    );
  }
}

@JsonSerializable()
class ProductItemDto {
  @JsonKey(name: "id")
  final dynamic id;

  @JsonKey(name: "name")
  final dynamic name;

  @JsonKey(name: "mrp")
  final dynamic mrp;

  @JsonKey(name: "is_in_wishlist")
  final dynamic isInWishlist;

  @JsonKey(name: "images")
  final List<String>? images;

  const ProductItemDto({
    this.id,
    this.name,
    this.mrp,
    this.isInWishlist,
    this.images,
  });

  factory ProductItemDto.fromJson(Map<String, dynamic> json) =>
      _$ProductItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductItemDtoToJson(this);

  /// DTO ➜ Domain Model
  ProductItemModel toModel() {
    return ProductItemModel(
      id: int.tryParse(id?.toString() ?? "0") ?? 0,
      name: name?.toString() ?? '',
      mrp: double.tryParse(mrp?.toString() ?? "0") ?? 0.0,
      isInWishlist: isInWishlist == 1 || isInWishlist == true,
      images: images ?? [],
    );
  }
}
