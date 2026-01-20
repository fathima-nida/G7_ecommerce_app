// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryItemDto _$CategoryItemDtoFromJson(Map<String, dynamic> json) =>
    CategoryItemDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CategoryItemDtoToJson(CategoryItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'images': instance.images,
    };
