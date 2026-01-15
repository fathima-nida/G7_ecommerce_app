import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:g7_comerce_app/core/constants/api_endpoints.dart';
import 'package:g7_comerce_app/data/common_dto/api_response_dto.dart';
import 'package:g7_comerce_app/data/home/dtos/section_newarrival/sec_newarrival_resp_dto.dart';
import 'package:g7_comerce_app/domain/common/app_failure.dart';
import 'package:g7_comerce_app/domain/common/generic_types.dart';
import 'package:g7_comerce_app/domain/home/models/section_newarrival/section_newarrival_req_model.dart';
import 'package:g7_comerce_app/domain/home/models/section_newarrival/section_newarrival_resp_model.dart';
import 'package:g7_comerce_app/domain/home/repository/sec_newarrival_repository.dart';
import 'package:g7_comerce_app/packeges/app_network/app_network.dart';

class SecNewarrivalRepositoryImp implements SecNewarrivalRepository {
  @override
  FutureEither<SectionWiseItemsRespModel> fetchSecNewarrival(
    SectionWiseItemsReqModel request,
  ) async {
    try {
      // Replace {sectionName} in the endpoint
      final url = ApiEndpoints.secNewarrival.replaceFirst(
        '{sectionName}',
        request.sectionName,
      );

      final response = await AppNetwork.get(
        url: '${ApiEndpoints.baseUrl}$url',
        queryParameters: {
          'pageNumber': request.pageNumber,
          'pageSize': request.pageSize,
        },
      );

      log('SecNewArrival raw response: $response');

      return response.fold(
        (err) => Left(err),
        (success) {
          final responseData = ApiResponseDto<SecNewArrivalRespDto>.fromJson(
            success.data,
            dataParser: (json) => SecNewArrivalRespDto.fromJson(json),
          );

          if (!responseData.status || responseData.data == null) {
            return Left(
              AppFailure.server(
                responseData.message,
                responseData.statusCode,
              ),
            );
          }

          return Right(
            responseData.data!.toModel(),
          );
        },
      );
    } catch (e) {
      log('SecNewArrival Unexpected Error: $e');
      return Left(AppFailure.client('Something went wrong'));
    }
  }
}
