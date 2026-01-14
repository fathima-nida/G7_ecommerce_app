// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:g7_comerce_app/data/services/favourite_api.dart';
// import 'favourite_event.dart';
// import 'favourite_state.dart';

// class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
//   FavouriteBloc() : super(FavouriteLoading()) {

//     on<LoadFavourites>((event, emit) async {
//       try {
//         final data = await FavouriteApi.fetchFavourites();
//         emit(FavouriteLoaded(data));
//       } catch (e) {
//         emit(FavouriteError("Failed to load favourites"));
//       }
//     });

//     on<DeleteFavourite>((event, emit) async {
//       await FavouriteApi.deleteFavourite(event.id);
//       add(LoadFavourites());
//     });

//     on<AddToCartFromFavourite>((event, emit) async {
//       await FavouriteApi.addToCart(event.id);
//     });
//   }
// }
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:g7_comerce_app/data/services/favourite_api.dart';
// import 'package:g7_comerce_app/presentation/screens/favourite/bloc/favourite_event.dart';
// import 'package:g7_comerce_app/presentation/screens/favourite/bloc/favourite_state.dart';

// class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
//   final FavouriteApi api;

//   FavouriteBloc(this.api) : super(FavouriteLoading()) {

//     on<LoadFavourites>((event, emit) async {
//       try {
//         final data = await FavouriteApi.fetchFavourites();
//         emit(FavouriteLoaded(data));
//       } catch (_) {
//         emit(FavouriteError("Failed to load favourites"));
//       }
//     });

//     on<DeleteFavourite>((event, emit) async {
//       await FavouriteApi.deleteFavourite(event.id);
//       add(LoadFavourites());
//     });

//     on<AddToCartFromFavourite>((event, emit) async {
//       await FavouriteApi.addToCart(event.id);
//     });
//   }
// }
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g7_comerce_app/domain/repositories/favourite_repository.dart';
import 'package:g7_comerce_app/presentation/bloc/favourite/favourite_event.dart';
import 'package:g7_comerce_app/presentation/bloc/favourite/favourite_state.dart';


class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final FavouriteRepository repo;

  FavouriteBloc(this.repo) : super(FavouriteLoading()) {

    on<LoadFavourites>((event, emit) async {
      try {
        final data = await repo.getFavourites();
        emit(FavouriteLoaded(data));
      } catch (_) {
        emit(FavouriteError("Failed to load favourites"));
      }
    });

    on<DeleteFavourite>((event, emit) async {
      await repo.deleteFavourite(event.id);
      add(LoadFavourites());
    });

    on<AddToCartFromFavourite>((event, emit) async {
      await repo.addToCart(event.id);
    });
  }
}
