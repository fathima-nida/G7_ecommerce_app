import 'package:g7_comerce_app/domain/category/models/product_request_model.dart';
import 'package:g7_comerce_app/domain/category/models/product_response_model.dart';
import 'package:g7_comerce_app/domain/common/generic_types.dart';

abstract class ProductRepository {
  FutureEither<ProductDetailsResponse> getProductDetails(
      ProductRequestModel request);
}
