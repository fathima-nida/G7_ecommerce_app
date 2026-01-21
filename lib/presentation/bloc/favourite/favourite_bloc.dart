import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:g7_comerce_app/domain/favourite/model/favourite_item_response.dart';
import 'package:g7_comerce_app/domain/favourite/model/favourite_request_model.dart';
import 'package:g7_comerce_app/domain/favourite/repository/favourie_repository.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final FavouriteRepository repo;

  FavouriteBloc(this.repo) : super(FavouriteInitial()) {
    on<LoadFavouriteEvent>(_onLoadFavourites);
  }

  Future<void> _onLoadFavourites(
    LoadFavouriteEvent event,
    Emitter<FavouriteState> emit,
  ) async {
    emit(FavouriteLoading());

    final req = FavouriteRequestModel(
      pageNo: event.page,
      pageSize: event.pageSize,
    );

    final result = await repo.getFavourites(req);

    result.fold(
      (failure) => emit(FavouriteFailure(failure.message)),
      (success) => emit(FavouriteSuccess(success)),
    );
  }
}
