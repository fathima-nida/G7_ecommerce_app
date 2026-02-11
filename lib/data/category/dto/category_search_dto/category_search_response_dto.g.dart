// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_search_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModelDto _$CategoryModelDtoFromJson(Map<String, dynamic> json) =>
    CategoryModelDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CategoryModelDtoToJson(CategoryModelDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'images': instance.images,
    };

CategorySearchResponseDto _$CategorySearchResponseDtoFromJson(
  Map<String, dynamic> json,
) => CategorySearchResponseDto(
  status: json['status'] as bool,
  statusCode: (json['statusCode'] as num).toInt(),
  message: json['message'] as String,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => CategoryModelDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CategorySearchResponseDtoToJson(
  CategorySearchResponseDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data?.map((e) => e.toJson()).toList(),
};
