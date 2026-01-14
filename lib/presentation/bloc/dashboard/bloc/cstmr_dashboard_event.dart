part of 'cstmr_dashboard_bloc.dart';

abstract class CstmrDashboardEvent extends Equatable {
  const CstmrDashboardEvent();

  @override
  List<Object> get props => [];
}

class LoadCstmrDashboardEvent extends CstmrDashboardEvent {
  final DateTime fromDate;
  final DateTime toDate;

  const LoadCstmrDashboardEvent({
    required this.fromDate,
    required this.toDate,
  }); 

  @override
  List<Object> get props => [fromDate, toDate];
}

