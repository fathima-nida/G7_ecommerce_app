abstract class ProductEvent {}

class LoadProductEvent extends ProductEvent {
  final int id;
  LoadProductEvent(this.id);
}
