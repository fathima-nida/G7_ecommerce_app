import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:g7_comerce_app/domain/dashboard/models/order_view_req_model.dart';
import 'package:g7_comerce_app/domain/dashboard/models/order_view_resp_model.dart';
import 'package:g7_comerce_app/domain/dashboard/repositories/order_view_repository.dart';
import 'package:g7_comerce_app/presentation/screens/dashboard/order_view.dart';
import 'package:g7_comerce_app/utils/shared_pref_helper/shared_pref_helper.dart';

part 'order_view_event.dart';
part 'order_view_state.dart';

class OrderViewBloc extends Bloc<OrderViewEvent, OrderViewState> {
  final OrderViewRepository orderViewRepo;
  OrderViewBloc(this.orderViewRepo) : super(OrderViewInitial()) {
    on<LoadOrderViewEvent>(_onLoadingOrderView);
  }

  Future<void> _onLoadingOrderView(
    LoadOrderViewEvent event,
    Emitter<OrderViewState> emit,
  ) async {
    emit(OrderViewLoading());
    try {
      final req = OrderViewReqModel(orderId: event.orderId,
      );
      final result = await orderViewRepo.getOrderView(req);
      result.fold(
        (failure) => emit(OrderViewFailure(failure.message)),
        (success) => emit(OrderViewSuccess(success)),
      );
    } catch (e) {
      emit(OrderViewFailure(e.toString()));
    }
  }
}
