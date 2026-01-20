import 'package:g7_comerce_app/domain/common/generic_types.dart';
import 'package:g7_comerce_app/domain/dashboard/models/order_view_req_model.dart';
import 'package:g7_comerce_app/domain/dashboard/models/order_view_resp_model.dart';

abstract class OrderViewRepository {
  FutureEither<OrderViewRespModel> getOrderView(OrderViewReqModel reqModel);

}