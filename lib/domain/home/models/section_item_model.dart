import 'package:equatable/equatable.dart';

class SectionItemDataModel extends Equatable {
  final int id;
  final String name;
  final double mrp;
  final bool isInWishlist;
  final List<String> images;

  const SectionItemDataModel({
    required this.id,
    required this.name,
    required this.mrp,
    required this.isInWishlist,
    required this.images,
  });

  factory SectionItemDataModel.fromMap(Map<String, dynamic> map) {
    return SectionItemDataModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      mrp: (map['mrp'] as num?)?.toDouble() ?? 0.0,
      isInWishlist: map['is_in_wishlist'] == 1,
      images: List<String>.from(map['images'] ?? []),
    );
  }

  factory SectionItemDataModel.dummy() {
    return const SectionItemDataModel(
      id: 0,
      name: '',
      mrp: 0.0,
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

  SectionItemDataModel copyWith({
    int? id,
    String? name,
    double? mrp,
    bool? isInWishlist,
    List<String>? images,
  }) {
    return SectionItemDataModel(
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
