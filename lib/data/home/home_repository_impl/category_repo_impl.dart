import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:g7_comerce_app/core/constants/api_endpoints.dart';
import 'package:g7_comerce_app/data/common_dto/api_response_dto.dart';
import 'package:g7_comerce_app/data/home/dtos/categorylist/category_list_response_dto.dart';
import 'package:g7_comerce_app/domain/common/app_failure.dart';
import 'package:g7_comerce_app/domain/common/common_response_model.dart';
import 'package:g7_comerce_app/domain/common/generic_types.dart';
import 'package:g7_comerce_app/domain/home/models/categorylist/category_req_model.dart';
import 'package:g7_comerce_app/domain/home/models/categorylist/category_respo_model.dart';
import 'package:g7_comerce_app/domain/home/repository/category_repository.dart';
import 'package:g7_comerce_app/packeges/app_network/app_network.dart';

class CategoryRepoImpl extends CategoryRepository {
  @override
  FutureEither<CategoryListResponseModel> fetchCategory(
      CategoryListReqModel requestmodel) async {
    try {
      final response = await AppNetwork.get(
        url: '${ApiEndpoints.baseUrl}${ApiEndpoints.categoryList}',
      );

      return response.fold(
        (err) => Left(err),
        (success) {
          final apiResponse = ApiResponseDto<CategoryListResponseDto>.fromJson(
            success.data,
            dataParser: (json) => CategoryListResponseDto.fromJson(json),
          );

          if (!apiResponse.status || apiResponse.data == null) {
            return Left(
              AppFailure.server(apiResponse.message, apiResponse.statusCode),
            );
          }

          return Right(
            CategoryListResponseModel(
              common: CommonResponseModel(
                status: apiResponse.status,
                statusCode: apiResponse.statusCode,
                message: apiResponse.message,
              ),
              data: apiResponse.data!.toModel(),
            ),
          );
        },
      );
    } catch (e) {
      log("CategoryRepoImpl error: $e");
      return Left(AppFailure.client("Something went wrong"));
    }
  }
}
