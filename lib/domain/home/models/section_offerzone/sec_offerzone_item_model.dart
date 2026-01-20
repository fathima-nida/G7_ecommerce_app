import 'package:equatable/equatable.dart';

class OfferzoneItemDataModel extends Equatable {
  final int id;
  final String name;
  final double mrp;
  final int isInWishlist;
  final List<String> images;

  const OfferzoneItemDataModel({
    required this.id,
    required this.name,
    required this.mrp,
    required this.isInWishlist,
    required this.images,
  });

  factory OfferzoneItemDataModel.fromMap(Map<String, dynamic> map) {
    return OfferzoneItemDataModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      mrp: (map['mrp'] is int)
          ? (map['mrp'] as int).toDouble()
          : (map['mrp'] as double?) ?? 0.0,
      isInWishlist: map['is_in_wishlist']?.toInt() ?? 0,
      images: List<String>.from(map['images'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'mrp': mrp,
      'is_in_wishlist': isInWishlist,
      'images': images,
    };
  }

  OfferzoneItemDataModel copyWith({
    int? id,
    String? name,
    double? mrp,
    int? isInWishlist,
    List<String>? images,
  }) {
    return OfferzoneItemDataModel(
      id: id ?? this.id,
      name: name ?? this.name,
      mrp: mrp ?? this.mrp,
      isInWishlist: isInWishlist ?? this.isInWishlist,
      images: images ?? this.images,
    );
  }

  @override
  List<Object?> get props => [id, name, mrp, isInWishlist, images];
}
