import 'package:g7_comerce_app/domain/common/generic_types.dart';
import 'package:g7_comerce_app/domain/favourite/model/favourite_item_response.dart';
import 'package:g7_comerce_app/domain/favourite/model/favourite_request_model.dart';

abstract class FavouriteRepository {
  FutureEither<FavouriteItemResponse> getFavourites(
    FavouriteRequestModel request,
  );
}
