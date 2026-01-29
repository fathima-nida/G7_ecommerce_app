import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:g7_comerce_app/domain/favourite/model/favourite_add/whishlist_addreq.dart';
import 'package:g7_comerce_app/domain/favourite/model/favourite_load/favourite_item_response.dart';
import 'package:g7_comerce_app/domain/favourite/model/favourite_load/favourite_request_model.dart';
import 'package:g7_comerce_app/domain/favourite/repository/favourite_repository.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final FavouriteRepository repo;

  FavouriteBloc(this.repo) : super(FavouriteInitial()) {
    on<LoadFavouriteEvent>(_onLoadFavourites);
    on<AddFavouriteEvent>(_onAddFavourite);
    on<RemoveFavouriteEvent>(_onRemoveFavourite);
  }

  // LOAD
  Future<void> _onLoadFavourites(
    LoadFavouriteEvent event,
    Emitter<FavouriteState> emit,
  ) async {
    emit(FavouriteLoading());

    final req = FavouriteRequestModel(
      irId: 0,
      irName: '',
      irMrp: 0,
      stock: 0,
      irImages: const [],
      pageNo: event.page,
      pageSize: event.pageSize,
    );

    final result = await repo.getFavourites(req);

    result.fold(
      (failure) => emit(FavouriteFailure(failure.message)),
      (success) => emit(FavouriteSuccess(success)),
    );
  }

  // ADD
  Future<void> _onAddFavourite(
    AddFavouriteEvent event,
    Emitter<FavouriteState> emit,
  ) async {
    emit(FavouriteActionLoading());

    final req = WishlistRequestModel(
      productId: event.productId,
      isWishlist: 1,
    );

    final result = await repo.wishlistAction(req);

    result.fold(
      (failure) => emit(FavouriteFailure(failure.message)),
      (success) => emit(FavouriteActionSuccess(success.message)),
    );

    add(LoadFavouriteEvent(page: 1, pageSize: 10));
  }

  // REMOVE
  Future<void> _onRemoveFavourite(
    RemoveFavouriteEvent event,
    Emitter<FavouriteState> emit,
  ) async {
    emit(FavouriteActionLoading());

    final req = WishlistRequestModel(
      productId: event.productId,
      isWishlist: 0,
    );

    final result = await repo.wishlistAction(req);

    result.fold(
      (failure) => emit(FavouriteFailure(failure.message)),
      (success) => emit(FavouriteActionSuccess(success.message)),
    );

    add(LoadFavouriteEvent(page: 1, pageSize: 10));
  }
}
