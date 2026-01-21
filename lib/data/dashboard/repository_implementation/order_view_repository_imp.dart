import 'package:dartz/dartz.dart';
import 'package:g7_comerce_app/core/constants/api_endpoints.dart';
import 'package:g7_comerce_app/data/dashboard/dtos/order_view_dto.dart';
import 'package:g7_comerce_app/domain/common/generic_types.dart';
import 'package:g7_comerce_app/domain/dashboard/models/order_view_req_model.dart';
import 'package:g7_comerce_app/domain/dashboard/models/order_view_resp_model.dart';
import 'package:g7_comerce_app/domain/dashboard/repositories/order_view_repository.dart';
import 'package:g7_comerce_app/packeges/app_network/app_network.dart';

class OrderViewRepositoryImp extends OrderViewRepository {
  @override
  FutureEither<OrderViewRespModel> getOrderView(OrderViewReqModel reqModel) async {
    final response = await AppNetwork.get(
      url: '${ApiEndpoints.baseUrl}${ApiEndpoints.orderView}',
      queryParameters: reqModel.toMap(),
    );

    return response.fold((err) => Left(err), (success) {
      final dto = CheckoutListRespDto.fromJson(success.data as Map<String, dynamic>);
      return Right(dto.toModel().first);
    });
  }

}