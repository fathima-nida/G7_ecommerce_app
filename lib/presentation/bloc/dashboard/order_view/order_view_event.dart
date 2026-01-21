part of 'order_view_bloc.dart';

sealed class OrderViewEvent extends Equatable {
  const OrderViewEvent();

  @override
  List<Object> get props => [];
}

class LoadOrderViewEvent extends OrderViewEvent {

final int orderId;
 

  const LoadOrderViewEvent({
    required this.orderId
  });

  @override
  List<Object> get props => [orderId];
}
