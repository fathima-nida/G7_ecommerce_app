class CartRequestModel {
  final int page;
  final int pageSize;

  CartRequestModel({
    required this.page,
    required this.pageSize,
  });

  Map<String, dynamic> toJson() {
    return {
      "page": page,
      "pageSize": pageSize,
    };
  }
}
