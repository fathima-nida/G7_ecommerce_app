abstract class FavouriteEvent {}

class LoadFavourites extends FavouriteEvent {}

class DeleteFavourite extends FavouriteEvent {
  final int id;
  DeleteFavourite(this.id);
}

class AddToCartFromFavourite extends FavouriteEvent {
  final int id;
  AddToCartFromFavourite(this.id);
}
