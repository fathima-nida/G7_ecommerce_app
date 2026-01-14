import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:g7_comerce_app/domain/dashboard/models/cstmr_dashboard_req_model.dart';
import 'package:g7_comerce_app/domain/dashboard/models/cstmr_dashboard_resp_model.dart';
import 'package:g7_comerce_app/domain/dashboard/repositories/custom_dashboard_repo.dart';

part 'cstmr_dashboard_event.dart';
part 'cstmr_dashboard_state.dart';

class CstmrDashboardBloc
    extends Bloc<CstmrDashboardEvent, CstmrDashboardState> {
  final CstmrDashboardRepo repo;
  CstmrDashboardBloc( this.repo) : super(CstmrDashboardInitial()) {
    on<LoadCstmrDashboardEvent>(_onLoadDashboard);
  }
  Future<void> _onLoadDashboard(
    LoadCstmrDashboardEvent event,
    Emitter<CstmrDashboardState> emit,
  ) async {
    emit(CstmrDashboardLoading());
    final req = CstmrDashboardReqModel(
      fromData: event.fromDate,
      toDate: event.toDate,
    );
    final result = await repo.getCustomerDashboard(req);

    result.fold(
      (failure) => emit(cstmrDashboardFailure(failure.message)),
      (success) => emit(CstmrDashboardSuccess(success)),
    );
  }
}
