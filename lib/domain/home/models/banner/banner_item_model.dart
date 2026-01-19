import 'package:equatable/equatable.dart';

class BannerItemModel extends Equatable {
  final int id;
  final List<String> images;

  const BannerItemModel({
    required this.id,
    required this.images,
  });

  factory BannerItemModel.fromMap(Map<String, dynamic> map) {
    return BannerItemModel(
      id: map['id'] ?? 0,
      images: List<String>.from(map['images'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'images': images,
    };
  }

  @override
  List<Object?> get props => [id, images];
}
