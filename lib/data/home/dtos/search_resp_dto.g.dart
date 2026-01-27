// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_resp_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductRespDto _$ProductRespDtoFromJson(Map<String, dynamic> json) =>
    ProductRespDto(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductRespDtoToJson(ProductRespDto instance) =>
    <String, dynamic>{'data': instance.data};

ProductItemDto _$ProductItemDtoFromJson(Map<String, dynamic> json) =>
    ProductItemDto(
      id: json['id'],
      name: json['name'],
      mrp: json['mrp'],
      isInWishlist: json['is_in_wishlist'],
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ProductItemDtoToJson(ProductItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mrp': instance.mrp,
      'is_in_wishlist': instance.isInWishlist,
      'images': instance.images,
    };
