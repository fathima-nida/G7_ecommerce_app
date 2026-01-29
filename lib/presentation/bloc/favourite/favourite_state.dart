part of 'favourite_bloc.dart';

abstract class FavouriteState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FavouriteInitial extends FavouriteState {}

class FavouriteLoading extends FavouriteState {}

class FavouriteActionLoading extends FavouriteState {}

class FavouriteSuccess extends FavouriteState {
  final FavouriteItemResponse success;
  FavouriteSuccess(this.success);
}

class FavouriteActionSuccess extends FavouriteState {
  final String message;
  FavouriteActionSuccess(this.message);
}

class FavouriteFailure extends FavouriteState {
  final String message;
  FavouriteFailure(this.message);
}
