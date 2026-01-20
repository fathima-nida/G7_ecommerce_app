import 'package:g7_comerce_app/domain/common/generic_types.dart';
import 'package:g7_comerce_app/domain/home/models/section_offerzone/sec_offerzone_resp_model.dart';
import 'package:g7_comerce_app/domain/home/models/section_offerzone/section_offerzone_req_model.dart';

abstract class SecOfferzoneRepository {
  FutureEither<SectionOfferzoneItemsRespModel>fetchSecOfferzone(SectionOfferzoneReqModel requestmodel);
}