part of 'favourite_bloc.dart';

abstract class FavouriteEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadFavouriteEvent extends FavouriteEvent {
  final int page;
  final int pageSize;

  LoadFavouriteEvent({required this.page, required this.pageSize});

  @override
  List<Object?> get props => [page, pageSize];
}

class AddFavouriteEvent extends FavouriteEvent {
  final int productId;
  AddFavouriteEvent(this.productId);

  @override
  List<Object?> get props => [productId];
}

class RemoveFavouriteEvent extends FavouriteEvent {
  final int productId;
  RemoveFavouriteEvent(this.productId);

  @override
  List<Object?> get props => [productId];
}
