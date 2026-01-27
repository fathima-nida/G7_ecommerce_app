// class ProductRequestModel {
//   final int pageNo;
//   final int pageSize;
//   final int categoryId;

//   ProductRequestModel({
//     required this.pageNo,
//     required this.pageSize,
//     required this.categoryId,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'pageNo': pageNo,
//       'pageSize': pageSize,
//       'categoryId': categoryId,
//     };
//   }

// }
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
