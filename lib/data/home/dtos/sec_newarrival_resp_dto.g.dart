// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sec_newarrival_resp_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecNewArrivalRespDto _$SecNewArrivalRespDtoFromJson(
  Map<String, dynamic> json,
) => SecNewArrivalRespDto(
  pagination: json['pagination'] == null
      ? null
      : PaginationDto.fromJson(json['pagination'] as Map<String, dynamic>),
  sections: (json['sections'] as List<dynamic>?)
      ?.map((e) => SectionItemDataDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SecNewArrivalRespDtoToJson(
  SecNewArrivalRespDto instance,
) => <String, dynamic>{
  'pagination': instance.pagination?.toJson(),
  'sections': instance.sections?.map((e) => e.toJson()).toList(),
};
