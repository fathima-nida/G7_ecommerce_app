import 'package:equatable/equatable.dart';


class ProductRespModel extends Equatable {
  final List<ProductItemModel> data;

  const ProductRespModel({required this.data});

  factory ProductRespModel.fromMap(Map<String, dynamic> map) {
    return ProductRespModel(
      data: List<ProductItemModel>.from(
        (map['data'] ?? []).map(
          (x) => ProductItemModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory ProductRespModel.dummy() {
    return const ProductRespModel(data: []);
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  ProductRespModel copyWith({
    List<ProductItemModel>? data,
  }) {
    return ProductRespModel(
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [data];
}


class ProductItemModel extends Equatable {
  final int id;
  final String name;
  final double mrp;
  final bool isInWishlist;
  final List<String> images;

  const ProductItemModel({
    required this.id,
    required this.name,
    required this.mrp,
    required this.isInWishlist,
    required this.images,
  });

  factory ProductItemModel.fromMap(Map<String, dynamic> map) {
    return ProductItemModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      mrp: (map['mrp'] as num?)?.toDouble() ?? 0.0,
      isInWishlist: map['is_in_wishlist'] == 1,
      images: List<String>.from(map['images'] ?? []),
    );
  }

  factory ProductItemModel.dummy() {
    return const ProductItemModel(
      id: 0,
      name: '',
      mrp: 0,
      isInWishlist: false,
      images: [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'mrp': mrp,
      'is_in_wishlist': isInWishlist ? 1 : 0,
      'images': images,
    };
  }

  ProductItemModel copyWith({
    int? id,
    String? name,
    double? mrp,
    bool? isInWishlist,
    List<String>? images,
  }) {
    return ProductItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      mrp: mrp ?? this.mrp,
      isInWishlist: isInWishlist ?? this.isInWishlist,
      images: images ?? this.images,
    );
  }

  @override
  List<Object?> get props =>
      [id, name, mrp, isInWishlist, images];
}
