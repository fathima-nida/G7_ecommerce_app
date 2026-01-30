// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishlistDataDto _$WishlistDataDtoFromJson(Map<String, dynamic> json) =>
    WishlistDataDto(
      pagination: json['pagination'] == null
          ? null
          : PaginationDto.fromJson(json['pagination'] as Map<String, dynamic>),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => WishlistProductDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WishlistDataDtoToJson(WishlistDataDto instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
      'products': instance.products,
    };

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

WishlistProductDto _$WishlistProductDtoFromJson(Map<String, dynamic> json) =>
    WishlistProductDto(
      irId: json['ir_id'],
      irName: json['ir_name'],
      irMrp: json['ir_mrp'],
      stock: json['stock'],
      images: json['images'] as List<dynamic>?,
    );

Map<String, dynamic> _$WishlistProductDtoToJson(WishlistProductDto instance) =>
    <String, dynamic>{
      'ir_id': instance.irId,
      'ir_name': instance.irName,
      'ir_mrp': instance.irMrp,
      'stock': instance.stock,
      'images': instance.images,
    };
