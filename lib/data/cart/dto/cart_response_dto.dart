import 'package:g7_comerce_app/domain/cart/model/cart_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cart_response_dto.g.dart'; // ✅ must match file name

// ================== CART RESPONSE DTO ==================
@JsonSerializable()
class CartResponseDto {
  @JsonKey(name: "status")
  final bool status;

  @JsonKey(name: "statusCode")
  final int statusCode;

  @JsonKey(name: "message")
  final String message;

  @JsonKey(name: "data")
  final CartDataDto data;

  const CartResponseDto({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory CartResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CartResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CartResponseDtoToJson(this);

  CartResponse toModel() {
    return CartResponse(
      status: status,
      statusCode: statusCode,
      message: message,
      data: data.toModel(),
    );
  }
}

// ================== CART DATA DTO ==================
@JsonSerializable()
class CartDataDto {
  @JsonKey(name: "pagination")
  final PaginationDto pagination;

  @JsonKey(name: "products")
  final List<ProductDto> products;

  @JsonKey(name: "totalPrice")
  final double totalPrice;

  const CartDataDto({
    required this.pagination,
    required this.products,
    required this.totalPrice,
  });

  factory CartDataDto.fromJson(Map<String, dynamic> json) =>
      _$CartDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CartDataDtoToJson(this);

  CartData toModel() {
    return CartData(
      pagination: pagination.toModel(),
      products: products.map((e) => e.toModel()).toList(),
      totalPrice: totalPrice,
    );
  }
}

// ================== PAGINATION DTO ==================
@JsonSerializable()
class PaginationDto {
  @JsonKey(name: "page")
  final int page;

  @JsonKey(name: "pageSize")
  final int pageSize;

  @JsonKey(name: "totalRecords")
  final int totalRecords;

  @JsonKey(name: "totalPages")
  final int totalPages;

  const PaginationDto({
    required this.page,
    required this.pageSize,
    required this.totalRecords,
    required this.totalPages,
  });

  factory PaginationDto.fromJson(Map<String, dynamic> json) =>
      _$PaginationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationDtoToJson(this);

  Pagination toModel() {
    return Pagination(
      page: page,
      pageSize: pageSize,
      totalRecords: totalRecords,
      totalPages: totalPages,
    );
  }
}

// ================== PRODUCT DTO ==================
@JsonSerializable()
class ProductDto {
  @JsonKey(name: "productId")
  final int productId;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "qty")
  final int qty;

  @JsonKey(name: "price")
  final double price;

  @JsonKey(name: "image")
  final String image;

  const ProductDto({
    required this.productId,
    required this.name,
    required this.qty,
    required this.price,
    required this.image,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);

  Product toModel() {
    return Product(
      id: productId,
      name: name,
      qty: qty,
      price: price,
      image: image,
    );
  }
}
