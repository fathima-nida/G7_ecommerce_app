// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerDataDto _$BannerDataDtoFromJson(Map<String, dynamic> json) =>
    BannerDataDto(
      banner1: (json['banner1'] as List<dynamic>?)
          ?.map((e) => BannerItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      banner2: (json['banner2'] as List<dynamic>?)
          ?.map((e) => BannerItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BannerDataDtoToJson(BannerDataDto instance) =>
    <String, dynamic>{'banner1': instance.banner1, 'banner2': instance.banner2};
