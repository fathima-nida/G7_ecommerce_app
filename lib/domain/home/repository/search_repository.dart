import 'package:g7_comerce_app/domain/common/generic_types.dart';
import 'package:g7_comerce_app/domain/home/models/search_req_model.dart';
import 'package:g7_comerce_app/domain/home/models/search_resp_model.dart';
import 'package:pinput/pinput.dart';

abstract class SearchRepository {
  FutureEither<ProductRespModel> searchProducts(
   SearchReqModel req
  );
}