class CartResponse {
  final bool status;
  final int statusCode;
  final String message;
  final CartData data;

  CartResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    return CartResponse(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: CartData.fromJson(json['data']),
    );
  }
}

// class CartData {
//   final Pagination pagination;
//   final List<Product> products;

//   CartData({
//     required this.pagination,
//     required this.products,
//   });

//   factory CartData.fromJson(Map<String, dynamic> json) {
//     return CartData(
//       pagination: Pagination.fromJson(json['pagination']),
//       products: (json['products'] as List)
//           .map((e) => Product.fromJson(e))
//           .toList(),
//     );
//   }
// }
class CartData {
  final Pagination pagination;
  final List<Product> products;
  final double totalPrice;

  CartData({
    required this.pagination,
    required this.products,
    required this.totalPrice,
  });

  factory CartData.fromJson(Map<String, dynamic> json) {
    return CartData(
      pagination: Pagination.fromJson(json['pagination']),
      products: (json['products'] as List)
          .map((e) => Product.fromJson(e))
          .toList(),
      totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0.0,
    );
  }
}


class Pagination {
  final int page;
  final int pageSize;
  final int totalRecords;
  final int totalPages;

  Pagination({
    required this.page,
    required this.pageSize,
    required this.totalRecords,
    required this.totalPages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      page: json['page'],
      pageSize: json['pageSize'],
      totalRecords: json['totalRecords'],
      totalPages: json['totalPages'],
    );
  }
}

// class Product {
//   Product();

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product();
//   }
// }
class Product {
  final int id;
  final String name;
  final int qty;
  final double price;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.qty,
    required this.price,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['productId'], // map API key
      name: json['name'],
      qty: json['qty'],
      price: (json['price'] as num).toDouble(),
      image: json['image'],
    );
  }
}