part of 'favourite_bloc.dart';

abstract class FavouriteState extends Equatable {
  const FavouriteState();

  @override
  List<Object?> get props => [];
}

class FavouriteInitial extends FavouriteState {}

class FavouriteLoading extends FavouriteState {}

class FavouriteSuccess extends FavouriteState {
  final FavouriteItemResponse data;

  const FavouriteSuccess(this.data);

  @override
  List<Object?> get props => [data];
}

class FavouriteFailure extends FavouriteState {
  final String message;

  const FavouriteFailure(this.message);

  @override
  List<Object?> get props => [message];
}

