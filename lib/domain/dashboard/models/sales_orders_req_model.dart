import 'package:equatable/equatable.dart';

class SalesOrdersReqModel extends Equatable {
  final int pageNumber;
  final int pageSize;
  final DateTime fromDate;
  final DateTime toDate;

  const SalesOrdersReqModel({
    required this.pageNumber,
    required this.pageSize,
    required this.fromDate,
    required this.toDate
  });

  @override
  List<Object?> get props => [pageNumber,pageSize,fromDate,toDate];
   String formatDate(DateTime date) {
    final year = date.year.toString().padLeft(4, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return "$year-$month-$day";
  }
 Map<String,dynamic> toMap(){
      return {
        "pageNumber":pageNumber,
        "pageSize":pageSize,
        "fromDate":formatDate(fromDate),
        "toDate":formatDate(toDate),
      };
    }
}
