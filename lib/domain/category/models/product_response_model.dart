import 'package:equatable/equatable.dart';

class ProductDetailsResponse extends Equatable {
  final bool status;
  final int statusCode;
  final String message;
  final ProductDetailsModel data;
  
  const ProductDetailsResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
    
  });
  

  factory ProductDetailsResponse.fromMap(Map<String, dynamic> map) {
    return ProductDetailsResponse(
      status: map['status'] ?? false,
      statusCode: map['statusCode'] ?? 0,
      message: map['message'] ?? '',
      data: ProductDetailsModel.fromMap(map['data'] ?? {}),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'statusCode': statusCode,
      'message': message,
      'data': data.toMap(),
    };
  }

  @override
  List<Object?> get props => [status, statusCode, message, data];
}
class ProductDetailsModel extends Equatable {
  final int id;
  final String name;
  final int mrp;
  final bool isInWishlist;
  final String description;
  final List<String> images;

  const ProductDetailsModel({
    required this.id,
    required this.name,
    required this.mrp,
    required this.isInWishlist,
    required this.description,
    required this.images,
  });

  factory ProductDetailsModel.fromMap(Map<String, dynamic> map) {
    return ProductDetailsModel(
      id: map['ir_id'] ?? 0,
      name: map['ir_name'] ?? '',
      mrp: map['ir_mrp'] ?? 0,
      isInWishlist: map['is_in_wishlist'] ?? false,
      description: map['description'] ?? '',
      images: List<String>.from(map['images'] ?? []),
    );
  }

  factory ProductDetailsModel.dummy() {
    return const ProductDetailsModel(
      id: 0,
      name: '',
      mrp: 0,
      isInWishlist: false,
      description: '',
      images: [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ir_id': id,
      'ir_name': name,
      'ir_mrp': mrp,
      'is_in_wishlist': isInWishlist,
      'description': description,
      'images': images,
    };
  }

  @override
  List<Object?> get props => [id, name, mrp, isInWishlist, description, images];
}
