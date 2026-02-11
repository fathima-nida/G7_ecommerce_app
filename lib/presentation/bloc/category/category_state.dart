import 'package:equatable/equatable.dart';
import 'package:g7_comerce_app/domain/category/models/category_byname/categorysearch_response_model.dart';

abstract class CategorySearchState extends Equatable {
  const CategorySearchState();

  @override
  List<Object?> get props => [];
}

class CategorySearchInitial extends CategorySearchState {}

class CategorySearchLoading extends CategorySearchState {}

class CategorySearchLoaded extends CategorySearchState {
  final CategorySearchResponseModel response;

  const CategorySearchLoaded(this.response);

  @override
  List<Object?> get props => [response];
}

class CategorySearchError extends CategorySearchState {
  final String message;

  const CategorySearchError(this.message);

  @override
  List<Object?> get props => [message];
}
