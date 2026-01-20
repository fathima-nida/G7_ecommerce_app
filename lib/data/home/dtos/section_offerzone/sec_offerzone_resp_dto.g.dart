// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sec_offerzone_resp_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionOfferzoneRespDto _$SectionOfferzoneRespDtoFromJson(
  Map<String, dynamic> json,
) => SectionOfferzoneRespDto(
  pagination: json['pagination'] == null
      ? null
      : PaginationDto.fromJson(json['pagination'] as Map<String, dynamic>),
  sections: (json['sections'] as List<dynamic>?)
      ?.map((e) => SectionItemDataDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SectionOfferzoneRespDtoToJson(
  SectionOfferzoneRespDto instance,
) => <String, dynamic>{
  'pagination': instance.pagination?.toJson(),
  'sections': instance.sections?.map((e) => e.toJson()).toList(),
};
