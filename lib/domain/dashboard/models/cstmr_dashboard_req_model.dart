import 'package:equatable/equatable.dart';

class CstmrDashboardReqModel extends Equatable {
  final DateTime fromDate;
  final DateTime toDate;
  const CstmrDashboardReqModel({required this.fromDate, required this.toDate});

  @override
  List<Object?> get props => [fromDate, toDate];
  String formatDate(DateTime date) {
    final year = date.year.toString().padLeft(4, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return "$year-$month-$day";
  }

  Map<String, dynamic> toMap() {
    return {"fromDate": formatDate(fromDate), "toDate": formatDate(toDate)};
  }
}
