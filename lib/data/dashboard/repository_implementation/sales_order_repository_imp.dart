import 'package:dartz/dartz.dart';
import 'package:g7_comerce_app/core/constants/api_endpoints.dart';
import 'package:g7_comerce_app/data/dashboard/dtos/sales_orders_dto.dart';
import 'package:g7_comerce_app/domain/common/app_failure.dart';
import 'package:g7_comerce_app/domain/common/generic_types.dart';
import 'package:g7_comerce_app/domain/dashboard/models/sales_orders_req_model.dart';
import 'package:g7_comerce_app/domain/dashboard/models/sales_orders_resp_model.dart';
import 'package:g7_comerce_app/domain/dashboard/repositories/sales_orders_repository.dart';
import 'package:g7_comerce_app/packeges/app_network/app_network.dart';

class SalesOrderRepositoryImp extends SalesOrdersRepository {
  @override
  FutureEither<SalesOrdersRespModel> getSalesOrders(
    SalesOrdersReqModel reqModel,
  ) async {
    final response = await AppNetwork.get(
      url: '${ApiEndpoints.baseUrl}${ApiEndpoints.salesOrders}',
      queryParameters: reqModel.toMap(),
    );

    return response.fold((err) => Left(err), (success) {
     
      // if (success.data is! Map<String, dynamic>) {
      //     return Left(
      //       AppFailure(message: "Invalid response format", type: null, statusCode: null),
      //     );
      //   }

      final dto=SalesOrdersRespDto.fromJson(success.data as Map<String, dynamic>);
      return Right(dto.toModel());
    });
  }
}
