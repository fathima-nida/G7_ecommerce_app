import 'package:g7_comerce_app/domain/category/models/category_byname/categoryname_req_model.dart';
import 'package:g7_comerce_app/domain/category/models/category_byname/categorysearch_response_model.dart';
import 'package:g7_comerce_app/domain/common/generic_types.dart';

abstract class CategoriesRepo{
  FutureEither<CategorySearchResponseModel>fetchCategories(CategorySearchRequestModel request);
}