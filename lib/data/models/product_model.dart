class ProductModel {
  final int id;
  final String name;
  final int price;
  final String description;
  final List<String> images;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      images: List<String>.from(json['images']),
    );
  }
}
