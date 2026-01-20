import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:g7_comerce_app/core/constants/api_endpoints.dart';
import 'package:g7_comerce_app/data/common_dto/api_response_dto.dart';
import 'package:g7_comerce_app/data/home/dtos/banner/banner_data_dto.dart';
import 'package:g7_comerce_app/domain/common/app_failure.dart';
import 'package:g7_comerce_app/domain/common/common_response_model.dart';
import 'package:g7_comerce_app/domain/common/generic_types.dart';
import 'package:g7_comerce_app/domain/home/models/banner/banner_responsemodel.dart';
import 'package:g7_comerce_app/domain/home/repository/banner_repository.dart';
import 'package:g7_comerce_app/packeges/app_network/app_network.dart';

class BannerRepoImpl extends BannerRepository {
  @override
  FutureEither<BannerResponseModel> fetchbanner() async {
    try {
      final response = await AppNetwork.get(
        url: "${ApiEndpoints.baseUrl}${ApiEndpoints.banner}",
      );

      return response.fold(
        (err) => Left(err),
        (success) {
          final apiResponse = ApiResponseDto<BannerDataDto>.fromJson(
            success.data,
            dataParser: (json) => BannerDataDto.fromJson(json),
          );

          if (!apiResponse.status || apiResponse.data == null) {
            return Left(
              AppFailure.server(
                apiResponse.message,
                apiResponse.statusCode,
              ),
            );
          }

          return Right(
            BannerResponseModel(
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
      log('banner error: $e');
      return Left(AppFailure.client("Something went wrong"));
    }
  }
}
