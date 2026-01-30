// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsResponseDto _$ProductDetailsResponseDtoFromJson(
  Map<String, dynamic> json,
) => ProductDetailsResponseDto(
  status: json['status'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : ProductDetailsDto.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProductDetailsResponseDtoToJson(
  ProductDetailsResponseDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};

ProductDetailsDto _$ProductDetailsDtoFromJson(Map<String, dynamic> json) =>
    ProductDetailsDto(
      id: json['ir_id'],
      name: json['ir_name'] as String?,
      mrp: json['ir_mrp'],
      isInWishlist: json['is_in_wishlist'] as bool?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ProductDetailsDtoToJson(ProductDetailsDto instance) =>
    <String, dynamic>{
      'ir_id': instance.id,
      'ir_name': instance.name,
      'ir_mrp': instance.mrp,
      'is_in_wishlist': instance.isInWishlist,
      'images': instance.images,
    };
