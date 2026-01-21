part of 'favourite_bloc.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object?> get props => [];
}

class LoadFavouriteEvent extends FavouriteEvent {
  final int page;
  final int pageSize;

  const LoadFavouriteEvent({
    this.page = 1,
    this.pageSize = 10,
  });

  @override
  List<Object?> get props => [page, pageSize];
}
