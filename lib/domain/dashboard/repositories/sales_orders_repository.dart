import 'package:g7_comerce_app/domain/common/generic_types.dart';
import 'package:g7_comerce_app/domain/dashboard/models/sales_orders_req_model.dart';
import 'package:g7_comerce_app/domain/dashboard/models/sales_orders_resp_model.dart';

abstract class SalesOrdersRepository {
  FutureEither<SalesOrdersRespModel> getSalesOrders(
      SalesOrdersReqModel reqModel);

}