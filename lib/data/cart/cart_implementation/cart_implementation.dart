import 'package:dartz/dartz.dart';
import 'package:g7_comerce_app/core/constants/api_endpoints.dart';
import 'package:g7_comerce_app/data/cart/dto/cart_response_dto.dart';
import 'package:g7_comerce_app/data/common_dto/api_response_dto.dart';

import 'package:g7_comerce_app/domain/cart/model/cart_request.dart';
import 'package:g7_comerce_app/domain/cart/model/cart_response.dart';

import 'package:g7_comerce_app/domain/cart/repositories/cart_repo.dart';
import 'package:g7_comerce_app/domain/common/app_failure.dart';
import 'package:g7_comerce_app/domain/common/generic_types.dart';
import 'package:g7_comerce_app/packeges/app_network/app_network.dart';

class CartImplementation extends CartRepo {
  @override
  FutureEither<CartResponse> getCart() async {
    final response = await AppNetwork.get(
      url: '${ApiEndpoints.baseUrl}${ApiEndpoints.cart}',
    );

    return response.fold(
      (err) => Left(err),
      (success) {
        final responseData = ApiResponseDto<CartResponse>.fromJson(
          success.data,
          dataParser: (json) =>
              CartResponseDto.fromJson(json).toModel(),
        );

        if (responseData.status && responseData.data != null) {
          return Right(responseData.data!);
        } else {
          return Left(
            AppFailure.server(
              responseData.message,
              responseData.statusCode,
            ),
          );
        }
      },
    );
  }

  @override
  FutureEither<CartResponse> getCartList(CartRequestModel reqModel) {
    // TODO: implement getCartList
    throw UnimplementedError();
  }
}
