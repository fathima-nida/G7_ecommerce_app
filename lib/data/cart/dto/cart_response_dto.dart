// import 'package:json_annotation/json_annotation.dart';
// import 'package:g7_comerce_app/domain/cart/model/cart_response_model.dart';

// part 'cart_response_dto.g.dart'; // ✅ must match file name

// /// ================== CART RESPONSE DTO ==================
// @JsonSerializable()
// class CartResponseDto {
//   @JsonKey(name: "data")
//   final CartDataDto? data;

//   const CartResponseDto({
//     this.data,
//   });

//   factory CartResponseDto.fromJson(Map<String, dynamic> json) =>
//       _$CartResponseDtoFromJson(json);

//   Map<String, dynamic> toJson() => _$CartResponseDtoToJson(this);

//   /// DTO → DOMAIN MODEL
//   CartDataModel toModel() {
//     return data?.toModel() ?? CartDataModel.dummy();
//   }
// }

// /// ================== CART DATA DTO ==================
// @JsonSerializable()
// class CartDataDto {
//   @JsonKey(name: "pagination")
//   final PaginationDto? pagination;

//   @JsonKey(name: "products")
//   final List<CartProductDto>? products;

//   @JsonKey(name: "totalPrice")
//   final dynamic totalPrice;

//   const CartDataDto({
//     this.pagination,
//     this.products,
//     this.totalPrice,
//   });

//   factory CartDataDto.fromJson(Map<String, dynamic> json) =>
//       _$CartDataDtoFromJson(json);

//   Map<String, dynamic> toJson() => _$CartDataDtoToJson(this);

//   CartDataModel toModel() {
//     return CartDataModel(
//       pagination: pagination?.toModel() ?? PaginationModel.dummy(),
//       products: (products ?? []).map((e) => e.toModel()).toList(),
//       totalPrice: num.tryParse(totalPrice?.toString() ?? "0") ?? 0,
//     );
//   }
// }

// /// ================== PAGINATION DTO ==================
// @JsonSerializable()
// class PaginationDto {
//   @JsonKey(name: "page")
//   final dynamic page;

//   @JsonKey(name: "pageSize")
//   final dynamic pageSize;

//   @JsonKey(name: "totalRecords")
//   final dynamic totalRecords;

//   @JsonKey(name: "totalPages")
//   final dynamic totalPages;

//   const PaginationDto({
//     this.page,
//     this.pageSize,
//     this.totalRecords,
//     this.totalPages,
//   });

//   factory PaginationDto.fromJson(Map<String, dynamic> json) =>
//       _$PaginationDtoFromJson(json);

//   Map<String, dynamic> toJson() => _$PaginationDtoToJson(this);

//   PaginationModel toModel() {
//     return PaginationModel(
//       page: int.tryParse(page?.toString() ?? "0") ?? 0,
//       pageSize: int.tryParse(pageSize?.toString() ?? "0") ?? 0,
//       totalRecords: int.tryParse(totalRecords?.toString() ?? "0") ?? 0,
//       totalPages: int.tryParse(totalPages?.toString() ?? "0") ?? 0,
//     );
//   }
// }

// /// ================== CART PRODUCT DTO ==================
// @JsonSerializable()
// class CartProductDto {
//   @JsonKey(name: "productId")
//   final dynamic productId;

//   @JsonKey(name: "name")
//   final dynamic name;

//   @JsonKey(name: "qty")
//   final dynamic qty;

//   @JsonKey(name: "price")
//   final dynamic price;

//   @JsonKey(name: "image")
//   final dynamic image;

//   @JsonKey(name: "description")
//   final dynamic description;

//   @JsonKey(name: "cartItemId")
//   final dynamic cartItemId;

//   const CartProductDto({
//     this.productId,
//     this.name,
//     this.qty,
//     this.price,
//     this.image,
//     this.description,
//     this.cartItemId,
//   });

//   factory CartProductDto.fromJson(Map<String, dynamic> json) =>
//       _$CartProductDtoFromJson(json);

//   Map<String, dynamic> toJson() => _$CartProductDtoToJson(this);

//   CartProductModel toModel() {
//     return CartProductModel(
//       id: int.tryParse(productId?.toString() ?? "0") ?? 0,
//       name: name?.toString() ?? '',
//       qty: int.tryParse(qty?.toString() ?? "0") ?? 0,
//       price: num.tryParse(price?.toString() ?? "0") ?? 0,
//       image: image?.toString() ?? '',
//       description: description?.toString(),
//       cartItemId: int.tryParse(cartItemId?.toString() ?? "0") ?? 0,
//     );
//   }
// }


import 'package:g7_comerce_app/domain/cart/model/cart_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_response_dto.g.dart'; // ✅ must match file name

/// ================== CART RESPONSE DTO ==================
@JsonSerializable()
class CartResponseDto {
  @JsonKey(name: "data")
  final CartDataDto? data;

  const CartResponseDto({
    this.data,
  });

  factory CartResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CartResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CartResponseDtoToJson(this);

  /// DTO → DOMAIN MODEL
  CartDataresponseModel toModel() {
    return data?.toModel() ?? CartDataresponseModel.dummy();
  }
}

/// ================== CART DATA DTO ==================
@JsonSerializable()
class CartDataDto {
  @JsonKey(name: "pagination")
  final PaginationDto? pagination;

  @JsonKey(name: "products")
  final List<CartProductDto>? products;

  @JsonKey(name: "totalPrice")
  final dynamic totalPrice;

  const CartDataDto({
    this.pagination,
    this.products,
    this.totalPrice,
  });

  factory CartDataDto.fromJson(Map<String, dynamic> json) =>
      _$CartDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CartDataDtoToJson(this);

  CartDataresponseModel toModel() {
    return CartDataresponseModel(
      pagination: pagination?.toModel() ?? PaginationModel.dummy(),
      products: (products ?? []).map((e) => e.toModel()).toList(),
      totalPrice: num.tryParse(totalPrice?.toString() ?? "0") ?? 0,
    );
  }
}

/// ================== PAGINATION DTO ==================
@JsonSerializable()
class PaginationDto {
  @JsonKey(name: "page")
  final dynamic page;

  @JsonKey(name: "pageSize")
  final dynamic pageSize;

  @JsonKey(name: "totalRecords")
  final dynamic totalRecords;

  @JsonKey(name: "totalPages")
  final dynamic totalPages;

  const PaginationDto({
    this.page,
    this.pageSize,
    this.totalRecords,
    this.totalPages,
  });

  factory PaginationDto.fromJson(Map<String, dynamic> json) =>
      _$PaginationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationDtoToJson(this);

  PaginationModel toModel() {
    return PaginationModel(
      page: int.tryParse(page?.toString() ?? "0") ?? 0,
      pageSize: int.tryParse(pageSize?.toString() ?? "0") ?? 0,
      totalRecords: int.tryParse(totalRecords?.toString() ?? "0") ?? 0,
      totalPages: int.tryParse(totalPages?.toString() ?? "0") ?? 0,
    );
  }
}

/// ================== CART PRODUCT DTO ==================
@JsonSerializable()
class CartProductDto {
  @JsonKey(name: "productId")
  final dynamic productId;

  @JsonKey(name: "name")
  final dynamic name;

  @JsonKey(name: "qty")
  final dynamic qty;

  @JsonKey(name: "price")
  final dynamic price;

  @JsonKey(name: "image")
  final dynamic image;

  @JsonKey(name: "description")
  final dynamic description;

  @JsonKey(name: "cartItemId")
  final dynamic cartItemId;

  const CartProductDto({
    this.productId,
    this.name,
    this.qty,
    this.price,
    this.image,
    this.description,
    this.cartItemId,
  });

  factory CartProductDto.fromJson(Map<String, dynamic> json) =>
      _$CartProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CartProductDtoToJson(this);

  CartProductModel toModel() {
    return CartProductModel(
      id: int.tryParse(productId?.toString() ?? "0") ?? 0,
      name: name?.toString() ?? '',
      qty: int.tryParse(qty?.toString() ?? "0") ?? 0,
      price: num.tryParse(price?.toString() ?? "0") ?? 0,
      image: image?.toString() ?? '',
      description: description?.toString(),
      cartItemId: int.tryParse(cartItemId?.toString() ?? "0") ?? 0,
    );
  }
}
