import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:g7_comerce_app/core/constants/api_endpoints.dart';
import 'package:g7_comerce_app/data/home/dtos/search_resp_dto.dart';
import 'package:g7_comerce_app/domain/common/generic_types.dart';
import 'package:g7_comerce_app/domain/home/models/search_req_model.dart';
import 'package:g7_comerce_app/domain/home/models/search_resp_model.dart';
import 'package:g7_comerce_app/domain/home/repository/search_repository.dart';
import 'package:g7_comerce_app/packeges/app_network/app_network.dart';

class SearchRepositoryImp extends SearchRepository{
  @override
  FutureEither<ProductRespModel> searchProducts(
    SearchReqModel reqModel,
  ) async {
final response = await AppNetwork.get(
  url: '${ApiEndpoints.baseUrl}${ApiEndpoints.searchProducts}',
  queryParameters: reqModel.toMap(),
);

return response.fold(
  (err) => Left(err),
  (success) {
    final dto = ProductRespDto.fromJson(
      success.data as Map<String, dynamic>,
    );
return Right(dto.toModel());
},
);
}
}