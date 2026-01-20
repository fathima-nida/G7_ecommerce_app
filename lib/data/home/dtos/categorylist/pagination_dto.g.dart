// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationDto _$PaginationDtoFromJson(Map<String, dynamic> json) =>
    PaginationDto(
      page: json['page'],
      pageSize: json['pageSize'],
      totalRecords: json['totalRecords'],
      totalPages: json['totalPages'],
    );

Map<String, dynamic> _$PaginationDtoToJson(PaginationDto instance) =>
    <String, dynamic>{
      'page': instance.page,
      'pageSize': instance.pageSize,
      'totalRecords': instance.totalRecords,
      'totalPages': instance.totalPages,
    };
