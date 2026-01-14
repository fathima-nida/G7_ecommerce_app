import 'package:g7_comerce_app/data/models/favouritemodel.dart';
import 'package:g7_comerce_app/data/services/favourite_api.dart';

import '../../domain/repositories/favourite_repository.dart';

class FavouriteRepositoryImpl implements FavouriteRepository {
  final FavouriteApi api;

  FavouriteRepositoryImpl(this.api);

  @override
  Future<List<FavouriteModel>> getFavourites() {
    return FavouriteApi.fetchFavourites();
  }

  @override
  Future<void> deleteFavourite(int id) {
    return FavouriteApi.deleteFavourite(id);
  }

  @override
  Future<void> addToCart(int id) {
    return FavouriteApi.addToCart(id);
  }
}
