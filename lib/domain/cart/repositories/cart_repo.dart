import 'package:g7_comerce_app/domain/cart/model/cart_request.dart';
import 'package:g7_comerce_app/domain/cart/model/cart_response.dart';
import 'package:g7_comerce_app/domain/common/generic_types.dart';

abstract class CartRepo {
  FutureEither<CartDataresponseModel>getCartList( CartRequestModel reqModel);

   FutureEither<void> increaseQuantity(int cartItemId);
   FutureEither<void> decreaseQuantity(int cartItemId);
   FutureEither<void> removeFromCart(int cartItemId);
}
