// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'whishlist_add_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishlistRequestDto _$WishlistRequestDtoFromJson(Map<String, dynamic> json) =>
    WishlistRequestDto(
      productId: (json['productId'] as num).toInt(),
      isWishlist: (json['isWishlist'] as num).toInt(),
    );

Map<String, dynamic> _$WishlistRequestDtoToJson(WishlistRequestDto instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'isWishlist': instance.isWishlist,
    };

WishlistActionResponseDto _$WishlistActionResponseDtoFromJson(
  Map<String, dynamic> json,
) => WishlistActionResponseDto(
  status: json['status'] as bool?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'],
);

Map<String, dynamic> _$WishlistActionResponseDtoToJson(
  WishlistActionResponseDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
