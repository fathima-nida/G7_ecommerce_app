import 'package:g7_comerce_app/domain/common/generic_types.dart';
import 'package:g7_comerce_app/domain/home/models/categorylist/category_req_model.dart';
import 'package:g7_comerce_app/domain/home/models/categorylist/category_respo_model.dart';

abstract class CategoryRepository {
FutureEither<CategoryListResponseModel>fetchCategory(CategoryListReqModel requestmodel);

}