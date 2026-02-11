import 'package:equatable/equatable.dart';
import 'package:g7_comerce_app/domain/category/models/category_byname/categoryname_req_model.dart';

abstract class CategorySearchEvent extends Equatable {
  const CategorySearchEvent();

  @override
  List<Object?> get props => [];
}

class FetchCategoriesByName extends CategorySearchEvent {
  final CategorySearchRequestModel request;

  const FetchCategoriesByName( this.request);

  @override
  List<Object?> get props => [request];
}
