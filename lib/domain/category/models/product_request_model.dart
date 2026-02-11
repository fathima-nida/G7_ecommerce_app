
import 'package:equatable/equatable.dart';

class ProductRequestModel extends Equatable {
  final int productId;
  

  const ProductRequestModel({
    required this.productId,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
    };
  }

  @override
  List<Object?> get props => [productId];
}
