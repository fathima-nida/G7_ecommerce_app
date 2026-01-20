import 'package:g7_comerce_app/domain/common/generic_types.dart';
import 'package:g7_comerce_app/domain/home/models/section_newarrival_req_model.dart';
import 'package:g7_comerce_app/domain/home/models/section_newarrival_resp_model.dart';

abstract class SecNewarrivalRepository {
  FutureEither< SectionWiseItemsRespModel>getSecNewarrival(SectionWiseItemsReqModel reqModel);
}