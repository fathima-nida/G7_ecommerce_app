import '../../../data/models/product_model.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final ProductModel product;
  ProductLoaded(this.product);
}

class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}
