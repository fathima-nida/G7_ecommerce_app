abstract class CartEvent {}

class LoadCart extends CartEvent {}

class IncreaseQuantity extends CartEvent {
  final int cartItemId;
  IncreaseQuantity(this.cartItemId);
}

class DecreaseQuantity extends CartEvent {
  final int cartItemId;
  DecreaseQuantity(this.cartItemId);
}

class RemoveFromCart extends CartEvent {
  final int cartItemId;
  RemoveFromCart(this.cartItemId);
}
