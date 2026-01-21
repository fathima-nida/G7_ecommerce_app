
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g7_comerce_app/domain/cart/model/cart_request.dart';
import 'package:g7_comerce_app/domain/cart/repositories/cart_repo.dart';

import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepo repository;

  CartBloc(this.repository) : super(CartInitial()) {

    // Load cart
    on<LoadCart>((event, emit) async {
      emit(CartLoading());
      try {
        final reqModel = CartRequestModel(page: 1, pageSize: 10);
        final result = await repository.getCartList(reqModel);

        result.fold(
          (failure) => emit(CartError(failure.message)),
          (cartResponse) => emit(CartLoaded(cartResponse)),
        );
      } catch (e) {
        emit(CartError("Something went wrong"));
      }
    });

    // Increase quantity
    on<IncreaseQuantity>((event, emit) async {
      if (state is CartLoaded) {
        try {
          await repository.increaseQuantity(event.cartItemId);
          final reqModel = CartRequestModel(page: 1, pageSize: 10);
          final result = await repository.getCartList(reqModel);

          result.fold(
            (failure) => emit(CartError(failure.message)),
            (cartResponse) => emit(CartLoaded(cartResponse)),
          );
        } catch (e) {
          emit(CartError("Failed to increase quantity"));
        }
      }
    });

    // Decrease quantity
    on<DecreaseQuantity>((event, emit) async {
      if (state is CartLoaded) {
        try {
          await repository.decreaseQuantity(event.cartItemId);
          final reqModel = CartRequestModel(page: 1, pageSize: 10);
          final result = await repository.getCartList(reqModel);

          result.fold(
            (failure) => emit(CartError(failure.message)),
            (cartResponse) => emit(CartLoaded(cartResponse)),
          );
        } catch (e) {
          emit(CartError("Failed to decrease quantity"));
        }
      }
    });

    // Remove item
    on<RemoveFromCart>((event, emit) async {
      if (state is CartLoaded) {
        try {
          await repository.removeFromCart(event.cartItemId);
          final reqModel = CartRequestModel(page: 1, pageSize: 10);
          final result = await repository.getCartList(reqModel);

          result.fold(
            (failure) => emit(CartError(failure.message)),
            (cartResponse) => emit(CartLoaded(cartResponse)),
          );
        } catch (e) {
          emit(CartError("Failed to remove item"));
        }
      }
    });
  }
}
