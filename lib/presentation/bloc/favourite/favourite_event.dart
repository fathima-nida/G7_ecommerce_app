part of 'favourite_bloc.dart';

class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object?> get props => [];
}
class RemoveFavouriteEvent extends FavouriteEvent {
  final int productId;

  const RemoveFavouriteEvent(this.productId);

  @override
  List<Object?> get props => [productId];
}

class LoadFavouriteEvent extends FavouriteEvent {
  final int page;
  final int pageSize;


  LoadFavouriteEvent({required this.page, required this.pageSize});
  // const LoadFavouriteEvent({
  //   this.page = 1,
  //   this.pageSize = 10,
  // });

  @override
  List<Object?> get props => [page, pageSize];
}
