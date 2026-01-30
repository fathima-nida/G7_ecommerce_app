import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:g7_comerce_app/core/constants/api_endpoints.dart';
import 'package:g7_comerce_app/data/favourite/dtos/favourite_dto.dart';
import 'package:g7_comerce_app/data/favourite/dtos/whislist/whishlist_add_dto.dart';
import 'package:g7_comerce_app/domain/common/generic_types.dart';
import 'package:g7_comerce_app/domain/favourite/model/favourite_add/whishlist_addreq.dart';
import 'package:g7_comerce_app/domain/favourite/model/favourite_add/whishlist_addresponse.dart';
import 'package:g7_comerce_app/domain/favourite/model/favourite_load/favourite_item_response.dart';
import 'package:g7_comerce_app/domain/favourite/model/favourite_load/favourite_request_model.dart';
import 'package:g7_comerce_app/domain/favourite/repository/favourite_repository.dart';
import 'package:g7_comerce_app/packeges/app_network/app_network.dart';

class FavouriteRepositoryImpl extends FavouriteRepository {
  @override
  FutureEither<FavouriteItemResponse> getFavourites(
    FavouriteRequestModel request,
  ) async {
    final response = await AppNetwork.get(
      url: '${ApiEndpoints.baseUrl}${ApiEndpoints.favourite}',
      queryParameters: request.toMap(),
    );
    log('respose...........$response');

    return response.fold(
      (err) => Left(err),
      (success) {
        final dto = WishlistDataDto.fromJson(
          success.data['data'] as Map<String, dynamic>,
        );

        return Right(dto.toModel());
      },
    );
  }

 @override
  FutureEither<WishlistActionResponse> wishlistAction(
    WishlistRequestModel request,
  ) async {
    final dto = WishlistRequestDto.fromModel(request);

    final response = await AppNetwork.post(
      url: '${ApiEndpoints.baseUrl}${ApiEndpoints.addToCart}',
      data: dto.toJson(),
    );

    return response.fold(
      (err) => Left(err),
      (success) {
        final resDto =
            WishlistActionResponseDto.fromJson(success.data);
        return Right(resDto.toModel());
      },
    );
  }

}
