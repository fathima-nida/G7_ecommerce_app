import 'package:g7_comerce_app/data/models/favouritemodel.dart';

//import '../../data/models/favourite_model.dart';

abstract class FavouriteRepository {
  Future<List<FavouriteModel>> getFavourites();
  Future<void> deleteFavourite(int id);
  Future<void> addToCart(int id);
}
