import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:g7_comerce_app/core/constants/api_endpoints.dart';
import 'package:g7_comerce_app/data/dashboard/dtos/cstm_dashboard_response_dto.dart';
import 'package:g7_comerce_app/domain/common/generic_types.dart';
import 'package:g7_comerce_app/domain/dashboard/models/cstmr_dashboard_req_model.dart';
import 'package:g7_comerce_app/domain/dashboard/models/cstmr_dashboard_resp_model.dart';
import 'package:g7_comerce_app/domain/dashboard/repositories/custom_dashboard_repo.dart';
import 'package:g7_comerce_app/packeges/app_network/app_network.dart';

class CstmrDashboardImpl extends CstmrDashboardRepo {
  @override
  FutureEither<CstmrDashboardRespModel> getCustomerDashboard(
    CstmrDashboardReqModel reqModel,
  ) async {
    log(
      'fromData = ${reqModel.fromDate.toString()}, toDate = ${reqModel.toDate.toString()}',
    );
    final response = await AppNetwork.get(
      url: '${ApiEndpoints.baseUrl}${ApiEndpoints.dashboard}',
      queryParameters: reqModel.toMap(),
    );

    return response.fold((err) => Left(err), (success) {
      final dashboardDto = CstmrDashboardRespDto.fromJson(
        success.data as Map<String, dynamic>,
      );

      return Right(dashboardDto.toModel());
    });
  }
}
