
// class CartDataResponseModel {
//   final Pagination pagination;
//   final List<Product> products;
 

//   CartDataResponseModel({
//     required this.pagination,
//     required this.products,
//   });

//   factory CartDataResponseModel.fromJson(Map<String, dynamic> json) {
//     return CartDataResponseModel(
//       pagination: Pagination.fromJson(json['pagination']),
//       products: (json['products'] as List)
//           .map((e) => Product.fromJson(e))
//           .toList(),
//     );
//   }
// }


// class Pagination {
//   final int page;
//   final int pageSize;
//   final int totalRecords;
//   final int totalPages;

//   Pagination({
//     required this.page,
//     required this.pageSize,
//     required this.totalRecords,
//     required this.totalPages,
//   });

//   factory Pagination.fromJson(Map<String, dynamic> json) {
//     return Pagination(
//       page: json['page'],
//       pageSize: json['pageSize'],
//       totalRecords: json['totalRecords'],
//       totalPages: json['totalPages'],
//     );
//   }
// }


// class Product {
//   final int id;
//   final String name;
//   final int qty;
//   final double price;
//   final String image;
//   final String? description;
//   final int cartItemId;

//   Product({
//     required this.id,
//     required this.name,
//     required this.qty,
//     required this.price,
//     required this.image,
//     required this.description,
//     required this.cartItemId,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['productId']??0, // map API key
//       name: json['name']??'',
//       qty: json['qty']??0,
//       price: (json['price'] as num?)?.toDouble()??0.0,
//       image: json['image']??'',
//       description: json['description'],
//       cartItemId: json['cartitemid']??0,
//     );
//   }
// }


import 'package:equatable/equatable.dart';

class CartDataresponseModel extends Equatable {
  final PaginationModel pagination;
  final List<CartProductModel> products;
  final num totalPrice;

  const CartDataresponseModel({
    required this.pagination,
    required this.products,
    required this.totalPrice,
  });

  factory CartDataresponseModel.dummy() {
    return CartDataresponseModel(
      pagination: PaginationModel.dummy(),
      products: const [],
      totalPrice: 0,
    );
  }

  @override
  List<Object?> get props => [
        pagination,
        products,
        totalPrice,
      ];
}

/// ================== PAGINATION MODEL ==================
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

  factory PaginationModel.dummy() {
    return const PaginationModel(
      page: 0,
      pageSize: 0,
      totalRecords: 0,
      totalPages: 0,
    );
  }

  @override
  List<Object?> get props => [
        page,
        pageSize,
        totalRecords,
        totalPages,
      ];
}

/// ================== CART PRODUCT MODEL ==================
class CartProductModel extends Equatable {
  final int id;
  final String name;
  final int qty;
  final num price;
  final String image;
  final String? description;
  final int cartItemId;

  const CartProductModel({
    required this.id,
    required this.name,
    required this.qty,
    required this.price,
    required this.image,
    required this.description,
    required this.cartItemId,
  });

  factory CartProductModel.dummy() {
    return const CartProductModel(
      id: -1,
      name: '',
      qty: 0,
      price: 0,
      image: '',
      description: null,
      cartItemId: -1,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        qty,
        price,
        image,
        description,
        cartItemId,
      ];
}