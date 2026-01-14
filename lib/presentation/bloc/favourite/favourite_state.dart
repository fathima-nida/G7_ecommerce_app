import 'package:g7_comerce_app/data/models/favouritemodel.dart';

abstract class FavouriteState {}

class FavouriteLoading extends FavouriteState {}

class FavouriteLoaded extends FavouriteState {
  final List<FavouriteModel> favourites;
  FavouriteLoaded(this.favourites);
}

class FavouriteError extends FavouriteState {
  final String message;
  FavouriteError(this.message);
}
