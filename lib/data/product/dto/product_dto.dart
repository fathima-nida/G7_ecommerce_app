import 'package:g7_comerce_app/domain/category/models/product_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_dto.g.dart';

@JsonSerializable()
class ProductDetailsResponseDto {
  @JsonKey(name: "status")
  final bool? status;

  @JsonKey(name: "statusCode")
  final int? statusCode;

  @JsonKey(name: "message")
  final String? message;

  @JsonKey(name: "data")
  final ProductDetailsDto? data;

  const ProductDetailsResponseDto({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  factory ProductDetailsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsResponseDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ProductDetailsResponseDtoToJson(this);

  /// DTO ➜ DOMAIN
  ProductDetailsResponse toModel() {
    return ProductDetailsResponse(
      status: status ?? false,
      statusCode: statusCode ?? 0,
      message: message ?? '',
      data: data?.toModel() ?? ProductDetailsModel.dummy(),
    );
  }
}
@JsonSerializable()
class ProductDetailsDto {
  @JsonKey(name: "ir_id")
  final dynamic id;

  @JsonKey(name: "ir_name")
  final String? name;

  @JsonKey(name: "ir_mrp")
  final dynamic mrp;

  @JsonKey(name: "is_in_wishlist")
  final bool? isInWishlist;

  @JsonKey(name: "images")
  final List<String>? images;

  const ProductDetailsDto({
    this.id,
    this.name,
    this.mrp,
    this.isInWishlist,
    this.images,
  });

  factory ProductDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ProductDetailsDtoToJson(this);

  /// DTO ➜ DOMAIN
  ProductDetailsModel toModel() {
    return ProductDetailsModel(
      id: int.tryParse(id?.toString() ?? '0') ?? 0,
      name: name ?? '',
      mrp: int.tryParse(mrp?.toString() ?? '0') ?? 0,
      isInWishlist: isInWishlist ?? false,
      images: images ?? const [],
    );
  }
}
