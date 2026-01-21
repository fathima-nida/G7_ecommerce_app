import 'package:dartz/dartz.dart';
import 'package:g7_comerce_app/core/constants/api_endpoints.dart';
import 'package:g7_comerce_app/data/favourite/dtos/favourite_dto.dart';
import 'package:g7_comerce_app/domain/common/generic_types.dart';
import 'package:g7_comerce_app/domain/favourite/model/favourite_item_response.dart';
import 'package:g7_comerce_app/domain/favourite/model/favourite_request_model.dart';
import 'package:g7_comerce_app/domain/favourite/repository/favourie_repository.dart';
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
}
