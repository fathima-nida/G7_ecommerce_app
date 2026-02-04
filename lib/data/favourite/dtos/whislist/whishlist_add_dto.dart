import 'package:g7_comerce_app/domain/favourite/model/favourite_add/whishlist_addreq.dart';
import 'package:g7_comerce_app/domain/favourite/model/favourite_add/whishlist_addresponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'whishlist_add_dto.g.dart'; 

@JsonSerializable()
class WishlistRequestDto {
  @JsonKey(name: "productId")
  final int productId;

  @JsonKey(name: "isWishlist")
  final int isWishlist;

  const WishlistRequestDto({
    required this.productId,
    required this.isWishlist,
  });

  factory WishlistRequestDto.fromJson(Map<String, dynamic> json) =>
      _$WishlistRequestDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WishlistRequestDtoToJson(this);

  WishlistRequestModel toModel() {
    return WishlistRequestModel(
      productId: productId,
      isWishlist: isWishlist,
    );
  }
   factory WishlistRequestDto.fromModel(WishlistRequestModel model) {
    return WishlistRequestDto(
      productId: model.productId,
      isWishlist: model.isWishlist,
    );
  }
}

@JsonSerializable()
class WishlistActionResponseDto {
  final bool? status;
  final int? statusCode;
  final String? message;
  final dynamic data;

  const WishlistActionResponseDto({
   required this.status,
   required this.statusCode,
   required this.message,
   required this.data,
  });

  factory WishlistActionResponseDto.fromJson(Map<String, dynamic> json) =>
      _$WishlistActionResponseDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WishlistActionResponseDtoToJson(this);

  WishlistActionResponse toModel() {
    return WishlistActionResponse(
      status: status ?? false,
      statusCode: statusCode ?? 0,
      message: message ?? '',
      data: data,
    );
  }
}
