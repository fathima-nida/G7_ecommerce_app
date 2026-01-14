
import 'package:g7_comerce_app/domain/common/generic_types.dart';
import 'package:g7_comerce_app/domain/dashboard/models/cstmr_dashboard_req_model.dart';
import 'package:g7_comerce_app/domain/dashboard/models/cstmr_dashboard_resp_model.dart';

abstract class CstmrDashboardRepo {
  FutureEither<CstmrDashboardRespModel>getCustomerDashboard(CstmrDashboardReqModel reqModel);
}


