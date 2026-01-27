import 'package:equatable/equatable.dart';

class FavouriteItemResponse extends Equatable {
  final int irId;
  final String irName;
  final int irMrp;
  final bool stock;
  final String description;
  final List<String> images;

  
  final PaginationModel pagination;
  final List<WishlistProductModel> products;

  const FavouriteItemResponse({
    required this.irId,
    required this.irName, 
  required this.irMrp,
   required this.stock,
   required this.description,
   required this.images,
    required this.pagination,
    required this.products,
  });

  factory FavouriteItemResponse.fromMap(Map<String, dynamic> map) {
    return FavouriteItemResponse(
      irId: map['ir_id'] ?? 0,
      irName: map['ir_name'] ?? '',
      irMrp: map['ir_mrp'] ?? 0,
      stock: map['stock'] ?? false,
      description: map['description'] ?? '',
      images: List<String>.from(map['images'] ?? []),
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
              irId: 0,
      irName: '',
      irMrp: 0,
      stock: false,
      description: '',
      images: const [],
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
      irId: irId,
      irName: irName,
      irMrp: irMrp,
      stock: stock,
      description: description,
      images: images,
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
  
  final String productName;
  final double price;
  final String imageUrl;
  final int irId;
  final String irName;
  final int irMrp;
  final bool stock;
  final List<String> images;


  const WishlistProductModel({
    required this.productName,
    required this.price,
    required this.imageUrl,
    required this.irId,
    required this.irName,
    required this.irMrp,
    required this.stock,
    required this.images,

  });

  factory WishlistProductModel.fromMap(Map<String, dynamic> map) {
  return WishlistProductModel(
    irId: map['itemId'] ?? 0,          // from API
    irName: map['itemName'] ?? '',     // fallback
    irMrp: (map['itemMrp'] ?? 0).toInt(),
    stock: true,                       // API may not return, default to true
    images: List<String>.from(map['images'] ?? []),
    productName: map['itemName'] ?? '',
    price: (map['price'] ?? 0).toDouble(),
    imageUrl: (map['images'] != null && (map['images'] as List).isNotEmpty)
        ? (map['images'] as List).first
        : '',
  );
}


  factory WishlistProductModel.dummy() {
    return const WishlistProductModel(
      irId: 0,
      irName: '',
      irMrp: 0,
      stock: false,
      images: [],
      productName: '',
      price: 0,
      imageUrl: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'irId': irId,
      'irName': irName,
      'irMrp': irMrp,
      'stock': stock,
      'images': images,
       'productName': productName,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  @override
  List<Object?> get props => [productName, price, imageUrl];
    
}
