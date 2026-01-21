

import 'package:equatable/equatable.dart';
import 'package:g7_comerce_app/domain/category/models/product_response_model.dart';

abstract class ProductDetailsState extends Equatable {
  const ProductDetailsState();

  @override
  List<Object?> get props => [];
}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsSuccess extends ProductDetailsState {
  final ProductDetailsResponse response;

  const ProductDetailsSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class ProductDetailsFailure extends ProductDetailsState {
  final String message;

  const ProductDetailsFailure(this.message);

  @override
  List<Object?> get props => [message];
}
