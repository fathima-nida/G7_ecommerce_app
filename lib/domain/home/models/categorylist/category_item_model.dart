import 'package:equatable/equatable.dart';

class CategoryItemModel extends Equatable {
  final int id;
  final String name;
  final List<String> images;

  const CategoryItemModel({
    required this.id,
    required this.name,
    required this.images,
  });

  factory CategoryItemModel.fromMap(Map<String, dynamic> map) {
    return CategoryItemModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      images: List<String>.from(map['images'] ?? []),
    );
  }

  factory CategoryItemModel.dummy() {
    return const CategoryItemModel(
      id: 0,
      name: '',
      images: [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'images': images,
    };
  }

  CategoryItemModel copyWith({
    int? id,
    String? name,
    List<String>? images,
  }) {
    return CategoryItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      images: images ?? this.images,
    );
  }

  @override
  List<Object?> get props => [id, name, images];
}
