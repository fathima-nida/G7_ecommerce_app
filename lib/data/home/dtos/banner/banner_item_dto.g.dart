// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerItemDto _$BannerItemDtoFromJson(Map<String, dynamic> json) =>
    BannerItemDto(
      id: (json['id'] as num?)?.toInt(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$BannerItemDtoToJson(BannerItemDto instance) =>
    <String, dynamic>{'id': instance.id, 'images': instance.images};
