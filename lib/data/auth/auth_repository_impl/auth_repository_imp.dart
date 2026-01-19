import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:g7_comerce_app/core/constants/api_endpoints.dart';
import 'package:g7_comerce_app/data/auth/dtos/auth_response_dto.dart';
import 'package:g7_comerce_app/data/auth/dtos/otp_response_dto.dart';
import 'package:g7_comerce_app/data/common_dto/api_response_dto.dart';
import 'package:g7_comerce_app/domain/auth/models/login_request_model.dart';
import 'package:g7_comerce_app/domain/auth/models/login_response.dart';
import 'package:g7_comerce_app/domain/auth/models/otp_request_model.dart';
import 'package:g7_comerce_app/domain/auth/models/otp_response_model.dart';
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
      log('login response :$response');
      return response.fold((err) => Left(err), (success) {
        
        final responseData = ApiResponseDto<LoginResponseDto>.fromJson(
          success.data,
          dataParser: (json) => LoginResponseDto.fromJson(json),
        );

        // if (json == null || json is! Map<String, dynamic>) {
        //   return Left(AppFailure.server("Invalid response format", 500));
        // }

        // final dto = LoginResponseDto.fromJson(responseData);
        // log('dto :${  dto.token}');
        if (!responseData.status || responseData.data == null) {
          return Left(
            AppFailure.server(responseData.message, responseData.statusCode),
          );
        }

        return Right(
          LoginResponseModel(
            token: responseData.data!.token ?? "",
            expiration: responseData.data!.expiration ?? "",
            otpCode: responseData.data!.otpCode ?? "",
          ),
        );
      });
    } catch (e) {
      log("AppAuth Unexpected Error: $e");
      return Left(AppFailure.client("Something went wrong"));
    }
  }

  @override
  FutureEither<OtpResponseModel> verifyOtp(OtpRequestModel requestModel) async {
    try {
      final response = await AppNetwork.post(
        url: '${ApiEndpoints.baseUrl}${ApiEndpoints.verifyOtp}',
        queryParameters: requestModel.toMap(),
       
      );

      return response.fold((err) => Left(err), (success) {
        // final json = success.data;

        final responseData = ApiResponseDto<OtpResponseDto>.fromJson(
          success.data,
          dataParser: (json) => OtpResponseDto.fromJson(json),
        );

        if (!responseData.status || responseData.data == null) {
          return Left(
            AppFailure.server(responseData.message, responseData.statusCode),
          );
        }
        return Right(
          responseData.data!.toModel(),
        );
      });
    } catch (e) {
      log("Verify OTP Error: $e");
      return Left(AppFailure.client("Something went wrong"));
    }
  }
}
