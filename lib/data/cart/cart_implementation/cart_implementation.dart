
import 'package:dartz/dartz.dart';
import 'package:g7_comerce_app/core/constants/api_endpoints.dart';
import 'package:g7_comerce_app/data/cart/dto/cart_response_dto.dart';
import 'package:g7_comerce_app/domain/cart/model/cart_request.dart';
import 'package:g7_comerce_app/domain/cart/model/cart_response.dart';
import 'package:g7_comerce_app/domain/cart/repositories/cart_repo.dart';
import 'package:g7_comerce_app/domain/common/generic_types.dart';
import 'package:g7_comerce_app/packeges/app_network/app_network.dart';

class CartImplementation extends CartRepo {
  @override
  FutureEither<CartDataresponseModel> getCartList(
    CartRequestModel reqModel,
  ) async {
    final response = await AppNetwork.get(
      url: '${ApiEndpoints.baseUrl}${ApiEndpoints.getcart}',
      queryParameters: reqModel.toMap(),
    );

    return response.fold(
      (err) => Left(err),
      (success) {
        final cartDto = CartResponseDto.fromJson(
          success.data as Map<String, dynamic>,
        );

        return Right(cartDto.toModel());
      },
    );
  }

  /// ================== INCREASE QUANTITY ==================
  @override
  FutureEither<void> increaseQuantity(int cartItemId) async {
    final response = await AppNetwork.post(
      url: '${ApiEndpoints.baseUrl}${ApiEndpoints.updatequantity}',
      body: {
        "cartItemId": cartItemId,
      },
    );

    return response.fold(
      (err) => Left(err),
      (_) => const Right(null),
    );
  }

  /// ================== DECREASE QUANTITY ==================
  @override
  FutureEither<void> decreaseQuantity(int cartItemId) async {
    final response = await AppNetwork.post(
      url: '${ApiEndpoints.baseUrl}${ApiEndpoints.updatequantity}',
      body: {
        "cartItemId": cartItemId,
      },
    );

    return response.fold(
      (err) => Left(err),
      (_) => const Right(null),
    );
  }

  /// ================== REMOVE FROM CART ==================
  @override
  FutureEither<void> removeFromCart(int cartItemId) async {
    final response = await AppNetwork.post(
      url: '${ApiEndpoints.baseUrl}${ApiEndpoints.updatequantity}',
      body: {
        "cartItemId": cartItemId,
      },
    );

    return response.fold(
      (err) => Left(err),
      (_) => const Right(null),
    );
  }
}
