
import 'package:g7_comerce_app/domain/favourite/model/favourite_load/favourite_item_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favourite_dto.g.dart';

@JsonSerializable()
class WishlistDataDto {
  @JsonKey(name: "pagination")
  final PaginationDto? pagination;

  @JsonKey(name: "products")
  final List<WishlistProductDto>? products;

  const WishlistDataDto({
    this.pagination,
    this.products,
  });

  factory WishlistDataDto.fromJson(Map<String, dynamic> json) =>
      _$WishlistDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WishlistDataDtoToJson(this);

  /// DTO → DOMAIN MODEL
  FavouriteItemResponse toModel() {
    return FavouriteItemResponse(
      pagination: pagination?.toModel() ?? PaginationModel.dummy(),
      products: (products ?? []).map((e) => e.toModel()).toList(),
    );
  }
}

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

@JsonSerializable()
class WishlistProductDto {
  @JsonKey(name: "ir_id")
  final dynamic irId;

  @JsonKey(name: "ir_name")
  final dynamic irName;

  @JsonKey(name: "ir_mrp")
  final dynamic irMrp;

  @JsonKey(name: "stock")
  final dynamic stock;

  @JsonKey(name: "images")
  final List<dynamic>? images;
  const WishlistProductDto({
    this.irId,
    this.irName,
    this.irMrp,
    this.stock,
    this.images,
  });

  factory WishlistProductDto.fromJson(Map<String, dynamic> json) =>
      _$WishlistProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WishlistProductDtoToJson(this);

  WishlistProductModel toModel() {
    return  WishlistProductModel(
      irId: irId ?? 0,
      irName: irName ?? "",
      irMrp:irMrp ??0,
      stock:stock ??0, 
      images: images?.map((e) => e.toString()).toList() ?? [],

    );
  }
}
