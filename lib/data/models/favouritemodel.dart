class FavouriteModel {
  final int id;
  final String title;
  final double price;
  final String image;

  FavouriteModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
  });

  factory FavouriteModel.fromJson(Map<String, dynamic> json) {
    return FavouriteModel(
      id: json['id'],
      title: json['title'],
      price: double.parse(json['price'].toString()),
      image: json['image'],
    );
  }
}
