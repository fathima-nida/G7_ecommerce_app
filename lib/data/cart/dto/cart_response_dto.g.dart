// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartResponseDto _$CartResponseDtoFromJson(Map<String, dynamic> json) =>
    CartResponseDto(
      status: json['status'] as bool,
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: CartDataDto.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartResponseDtoToJson(CartResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

CartDataDto _$CartDataDtoFromJson(Map<String, dynamic> json) => CartDataDto(
  pagination: PaginationDto.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
  products: (json['products'] as List<dynamic>)
      .map((e) => ProductDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalPrice: (json['totalPrice'] as num).toDouble(),
);

Map<String, dynamic> _$CartDataDtoToJson(CartDataDto instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
      'products': instance.products,
      'totalPrice': instance.totalPrice,
    };

PaginationDto _$PaginationDtoFromJson(Map<String, dynamic> json) =>
    PaginationDto(
      page: (json['page'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      totalRecords: (json['totalRecords'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
    );

Map<String, dynamic> _$PaginationDtoToJson(PaginationDto instance) =>
    <String, dynamic>{
      'page': instance.page,
      'pageSize': instance.pageSize,
      'totalRecords': instance.totalRecords,
      'totalPages': instance.totalPages,
    };

ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) => ProductDto(
  productId: (json['productId'] as num).toInt(),
  name: json['name'] as String,
  qty: (json['qty'] as num).toInt(),
  price: (json['price'] as num).toDouble(),
  image: json['image'] as String,
);

Map<String, dynamic> _$ProductDtoToJson(ProductDto instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'name': instance.name,
      'qty': instance.qty,
      'price': instance.price,
      'image': instance.image,
    };
