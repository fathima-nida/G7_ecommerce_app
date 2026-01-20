import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:g7_comerce_app/domain/dashboard/models/sales_orders_req_model.dart';
import 'package:g7_comerce_app/domain/dashboard/models/sales_orders_resp_model.dart';
import 'package:g7_comerce_app/domain/dashboard/repositories/sales_orders_repository.dart';

part 'sales_orders_event.dart';
part 'sales_orders_state.dart';

class SalesOrdersBloc extends Bloc<SalesOrdersEvent, SalesOrdersState> {
  final SalesOrdersRepository salesOrders;
  SalesOrdersBloc(this.salesOrders) : super(SalesOrdersBlocInitial()) {
    on<LoadSalesOrdersEvent>(_onLoadingSalesOrders);
  }

  Future<void> _onLoadingSalesOrders(
    LoadSalesOrdersEvent event,
    Emitter<SalesOrdersState> emit,
  ) async {
    emit(SalesOrdersLoading());
    try {
  final req = SalesOrdersReqModel(
    pageNumber: event.pageNumber,
    pageSize: event.pageSize,
    fromDate: event.fromDate,
    toDate: event.toDate,
  );
  final result = await salesOrders.getSalesOrders(req);
  result.fold(
    (failure) => emit(SalesOrdersFailure(failure.message)),
    (success) => emit(SalesOrdersSuccess(success)),
  );
} catch (e) {
  emit(SalesOrdersFailure(e.toString()));
}
  }
}
