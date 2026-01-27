import 'package:equatable/equatable.dart';
import 'package:g7_comerce_app/domain/cart/model/cart_response.dart';


abstract class CartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {}
class CartLoading extends CartState {}
class CartLoaded extends CartState {
  final CartDataresponseModel cartResponse;
  CartLoaded(this.cartResponse);

  @override
  List<Object?> get props => [cartResponse];
}
class CartError extends CartState {
  final String message;
  CartError(this.message);

  @override
  List<Object?> get props => [message];
}
