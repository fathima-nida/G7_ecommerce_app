part of 'cstmr_dashboard_bloc.dart';

abstract class CstmrDashboardState extends Equatable {
  const CstmrDashboardState();
  
  @override
  List<Object> get props => [];
}

final class CstmrDashboardInitial extends CstmrDashboardState {}
final class CstmrDashboardLoading extends CstmrDashboardState {}
final class CstmrDashboardSuccess extends CstmrDashboardState{
   final CstmrDashboardRespModel dashboard;

  const CstmrDashboardSuccess(this.dashboard);

  @override
  List<Object> get props => [dashboard];
}

class cstmrDashboardFailure extends CstmrDashboardState{
  final String message;

  const cstmrDashboardFailure(this.message);

  @override
  List<Object> get props => [message];
}
