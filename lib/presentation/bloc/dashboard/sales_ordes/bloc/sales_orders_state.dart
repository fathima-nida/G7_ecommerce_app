part of 'sales_orders_bloc.dart';

sealed class SalesOrdersState extends Equatable {
  const SalesOrdersState();
  
  @override
  List<Object> get props => [];
}

final class SalesOrdersBlocInitial extends SalesOrdersState {}
final class SalesOrdersLoading extends SalesOrdersState {}
final class SalesOrdersSuccess extends SalesOrdersState{

final SalesOrdersRespModel salesOrders;

  const SalesOrdersSuccess(this.salesOrders);

  @override
  List<Object> get props => [salesOrders];
}

final class SalesOrdersFailure extends SalesOrdersState{
  final String message;

  const SalesOrdersFailure(this.message);

  @override
  List<Object> get props => [message];
}