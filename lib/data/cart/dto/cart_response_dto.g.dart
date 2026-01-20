// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartResponseDto _$CartResponseDtoFromJson(Map<String, dynamic> json) =>
    CartResponseDto(
      data: json['data'] == null
          ? null
          : CartDataDto.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartResponseDtoToJson(CartResponseDto instance) =>
    <String, dynamic>{'data': instance.data};

CartDataDto _$CartDataDtoFromJson(Map<String, dynamic> json) => CartDataDto(
  pagination: json['pagination'] == null
      ? null
      : PaginationDto.fromJson(json['pagination'] as Map<String, dynamic>),
  products: (json['products'] as List<dynamic>?)
      ?.map((e) => CartProductDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalPrice: json['totalPrice'],
);

Map<String, dynamic> _$CartDataDtoToJson(CartDataDto instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
      'products': instance.products,
      'totalPrice': instance.totalPrice,
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

CartProductDto _$CartProductDtoFromJson(Map<String, dynamic> json) =>
    CartProductDto(
      productId: json['productId'],
      name: json['name'],
      qty: json['qty'],
      price: json['price'],
      image: json['image'],
      description: json['description'],
      cartItemId: json['cartItemId'],
    );

Map<String, dynamic> _$CartProductDtoToJson(CartProductDto instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'name': instance.name,
      'qty': instance.qty,
      'price': instance.price,
      'image': instance.image,
      'description': instance.description,
      'cartItemId': instance.cartItemId,
    };
