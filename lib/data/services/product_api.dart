import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductApi {
  static Future<ProductModel> getProduct(int id) async {
    final res = await http.get(Uri.parse("https://yourapi.com/api/products/$id"));

    if (res.statusCode == 200) {
      return ProductModel.fromJson(jsonDecode(res.body));
    } else {
      throw Exception("Failed to load product");
    }
  }
}
