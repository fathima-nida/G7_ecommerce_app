part of 'sales_orders_bloc.dart';

sealed class SalesOrdersEvent extends Equatable {
  const SalesOrdersEvent();

  @override
  List<Object> get props => [];
}
 class LoadSalesOrdersEvent extends SalesOrdersEvent{
final int pageNumber;
  final int pageSize;
  final DateTime fromDate;
  final DateTime toDate;

  const LoadSalesOrdersEvent({
    required this.pageNumber,
    required this.pageSize,
    required this.fromDate,
    required this.toDate
  });

  @override
  List<Object> get props => [pageNumber,pageSize,fromDate,toDate];
}
