import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:g7_comerce_app/core/constants/api_endpoints.dart';
import 'package:g7_comerce_app/data/category/dto/category_search_dto/category_search_response_dto.dart';
import 'package:g7_comerce_app/domain/category/models/category_byname/categoryname_req_model.dart';
import 'package:g7_comerce_app/domain/category/models/category_byname/categorysearch_response_model.dart';
import 'package:g7_comerce_app/domain/category/repositories/category_repo.dart';
import 'package:g7_comerce_app/domain/common/app_failure.dart';
import 'package:g7_comerce_app/domain/common/common_response_model.dart';
import 'package:g7_comerce_app/domain/common/generic_types.dart';
import 'package:g7_comerce_app/packeges/app_network/app_network.dart';

class CategorySearchRepoImpl extends CategoriesRepo {
  @override
  FutureEither<CategorySearchResponseModel> fetchCategories(
      CategorySearchRequestModel request) async {
    try {
      // Build URL depending on whether name is empty
      final url = request.name.isEmpty
          ? "${ApiEndpoints.baseUrl}${ApiEndpoints.categoryName}" // fetch all
          : "${ApiEndpoints.baseUrl}${ApiEndpoints.categoryName}/${request.name}"; // fetch by name

      log("CategorySearchRepoImpl URL: $url");

      final response = await AppNetwork.get(url: url);

      return response.fold(
        (err) => Left(err), // network error
        (success) {
          // Parse API response into DTO
          final apiResponse = CategorySearchResponseDto.fromJson(success.data);

          if (!apiResponse.status) {
            return Left(AppFailure.server(
              apiResponse.message,
              apiResponse.statusCode,
            ));
          }

          // Convert DTO → Domain Model
          final categoryModel = CategorySearchResponseModel(
            common: CommonResponseModel(
              status: apiResponse.status,
              statusCode: apiResponse.statusCode,
              message: apiResponse.message,
            ),
            data: apiResponse.toCategoryList(),
          );

          return Right(categoryModel);
        },
      );
    } catch (e) {
      log("CategorySearchRepoImpl error: $e");
      return Left(AppFailure.client("Something went wrong"));
    }
  }
}
