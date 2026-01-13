import 'package:equatable/equatable.dart';

class CstmrDashboardReqModel extends Equatable {
  final DateTime fromData;
  final DateTime toDate;
  const CstmrDashboardReqModel({required this.fromData, required this.toDate});

  @override
  List<Object?> get props => [fromData, toDate];
  String formatDate(DateTime date) {
    final year = date.year.toString().padLeft(4, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return "$year-$month-$day";
  }

  Map<String, dynamic> toMap() {
    return {"fromDate": formatDate(fromData), "toDate": formatDate(toDate)};
  }
}
