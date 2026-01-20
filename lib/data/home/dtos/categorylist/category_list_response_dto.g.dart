// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_list_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryListResponseDto _$CategoryListResponseDtoFromJson(
  Map<String, dynamic> json,
) => CategoryListResponseDto(
  pagination: json['pagination'] == null
      ? null
      : PaginationDto.fromJson(json['pagination'] as Map<String, dynamic>),
  categories: (json['categories'] as List<dynamic>?)
      ?.map((e) => CategoryItemDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CategoryListResponseDtoToJson(
  CategoryListResponseDto instance,
) => <String, dynamic>{
  'pagination': instance.pagination,
  'categories': instance.categories,
};
