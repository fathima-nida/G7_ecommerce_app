import 'package:g7_comerce_app/data/models/product_model.dart';
import 'package:g7_comerce_app/data/services/product_api.dart';

class ProductRepository {
  final ProductApi _api;

  ProductRepository(this._api);

  Future<ProductModel> getProduct(int id) async {
    return _api.getProduct(id);
  }
}
