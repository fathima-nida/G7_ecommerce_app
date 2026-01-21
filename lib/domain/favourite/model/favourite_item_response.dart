import 'package:equatable/equatable.dart';

class FavouriteItemResponse extends Equatable {
  final PaginationModel pagination;
  final List<WishlistProductModel> products;

  const FavouriteItemResponse({
    required this.pagination,
    required this.products,
  });

  factory FavouriteItemResponse.fromMap(Map<String, dynamic> map) {
    return FavouriteItemResponse(
      pagination: PaginationModel.fromMap(
        map['pagination'] ?? {},
      ),
      products: List<WishlistProductModel>.from(
        (map['products'] ?? []).map(
          (x) => WishlistProductModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory FavouriteItemResponse.dummy() {
    return  FavouriteItemResponse(
      pagination: PaginationModel.dummy(),
      products: const [], // ✅ FIXED
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pagination': pagination.toMap(),
      'products': products.map((x) => x.toMap()).toList(),
    };
  }

  FavouriteItemResponse copyWith({
    PaginationModel? pagination,
    List<WishlistProductModel>? products,
  }) {
    return FavouriteItemResponse(
      pagination: pagination ?? this.pagination,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [pagination, products];
}

/* ---------------- PAGINATION ---------------- */

class PaginationModel extends Equatable {
  final int page;
  final int pageSize;
  final int totalRecords;
  final int totalPages;

  const PaginationModel({
    required this.page,
    required this.pageSize,
    required this.totalRecords,
    required this.totalPages,
  });

  factory PaginationModel.fromMap(Map<String, dynamic> map) {
    return PaginationModel(
      page: map['page'] ?? 0,
      pageSize: map['pageSize'] ?? 0,
      totalRecords: map['totalRecords'] ?? 0,
      totalPages: map['totalPages'] ?? 0,
    );
  }

  factory PaginationModel.dummy() {
    return const PaginationModel(
      page: 0,
      pageSize: 0,
      totalRecords: 0,
      totalPages: 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'pageSize': pageSize,
      'totalRecords': totalRecords,
      'totalPages': totalPages,
    };
  }

  @override
  List<Object?> get props => [page, pageSize, totalRecords, totalPages];
}

/* ---------------- PRODUCT ---------------- */

class WishlistProductModel extends Equatable {
  const WishlistProductModel();

  factory WishlistProductModel.fromMap(Map<String, dynamic> map) {
    return const WishlistProductModel();
  }

  Map<String, dynamic> toMap() {
    return {};
  }

  @override
  List<Object?> get props => [];
}
