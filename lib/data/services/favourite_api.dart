import 'dart:convert';
import 'package:g7_comerce_app/data/models/favouritemodel.dart';
import 'package:http/http.dart' as http;


class FavouriteApi {
  static const String baseUrl = "https://your-swagger-url.com/api";

  static Future<List<FavouriteModel>> fetchFavourites() async {
    final response = await http.get(Uri.parse("$baseUrl/favourites"));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => FavouriteModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load favourites");
    }
  }

  static Future<void> deleteFavourite(int id) async {
     await http.delete(Uri.parse("$baseUrl/favourites/$id"));
  }

  static Future<void> addToCart(int id) async {
    await http.post(Uri.parse("$baseUrl/cart/$id"));
  }
}
