// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionItemDataDto _$SectionItemDataDtoFromJson(Map<String, dynamic> json) =>
    SectionItemDataDto(
      id: json['id'],
      name: json['name'],
      mrp: json['mrp'],
      isInWishlist: json['is_in_wishlist'],
      images: json['images'] as List<dynamic>?,
    );

Map<String, dynamic> _$SectionItemDataDtoToJson(SectionItemDataDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mrp': instance.mrp,
      'is_in_wishlist': instance.isInWishlist,
      'images': instance.images,
    };
