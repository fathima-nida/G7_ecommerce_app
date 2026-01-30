class WishlistRequestModel {
  final int productId;
  final int isWishlist; 

  WishlistRequestModel({
    required this.productId,
    required this.isWishlist,
  });

  Map<String, dynamic> toJson() {
    return {
      "productId": productId,
      "isWishlist": isWishlist,
    };
  }
}
