part of 'order_view_bloc.dart';

sealed class OrderViewState extends Equatable {
  const OrderViewState();
  
  @override
  List<Object> get props => [];
}

final class OrderViewInitial extends OrderViewState {}
final class OrderViewLoading extends OrderViewState {}
final class OrderViewSuccess extends OrderViewState{

final OrderViewRespModel orderViewRespModel;

  const OrderViewSuccess(this.orderViewRespModel);

  @override
  List<Object> get props => [orderViewRespModel];
}

final class OrderViewFailure extends OrderViewState{
  final String message;

  const OrderViewFailure(this.message);

  @override
  List<Object> get props => [message];

}
