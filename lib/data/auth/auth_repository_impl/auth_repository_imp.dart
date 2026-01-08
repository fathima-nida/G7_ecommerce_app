import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:g7_comerce_app/core/constants/api_endpoints.dart';
import 'package:g7_comerce_app/data/auth/dtos/auth_response_dto.dart';
import 'package:g7_comerce_app/domain/auth/models/login_request_model.dart';
import 'package:g7_comerce_app/domain/auth/models/login_response.dart';
import 'package:g7_comerce_app/domain/auth/repositories/login_repository.dart';
import 'package:g7_comerce_app/domain/common/app_failure.dart';
import 'package:g7_comerce_app/domain/common/generic_types.dart';
import 'package:g7_comerce_app/packeges/app_network/app_network.dart';

class AuthRepositoryImp extends LoginRepository {
  @override
  FutureEither<LoginResponseModel> loginAuth(LoginRequestModel reqModel) async {
    try {
      final response = await AppNetwork.post(
        url: '${ApiEndpoints.baseUrl}${ApiEndpoints.login}',
        queryParameters: reqModel.toMap(),
      );
      return response.fold((err) => Left(err), (success) {
        dynamic json = success.data;

        if (json is String) {
          json = jsonDecode(json);
        }

        if (json == null || json is! Map<String, dynamic>) {
          return Left(AppFailure.server("Invalid response format", 500));
        }

        final dto = LoginResponseDto.fromJson(json);

        // Extract actual token from inner JSON list
        String appToken = "";
        try {
          final decodedList = jsonDecode(dto.token); // string → list
          appToken = decodedList[0]['value'];
        } catch (e) {
          log("App Auth token decode failed: $e");
          return Left(AppFailure.server("Token decode failed", 500));
        }

        return Right(
          LoginResponseModel(
            token: appToken,
            expiration: '',
            otpCode: '',
            status: false,
            statusCode: 0,
            message: '',
          ),
        );
      });
    } catch (e) {
      log("AppAuth Unexpected Error: $e");
      return Left(AppFailure.client("Something went wrong"));
    }
  }
}
