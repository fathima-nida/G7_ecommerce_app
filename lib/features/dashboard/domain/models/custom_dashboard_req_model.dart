import 'package:equatable/equatable.dart';

class CustomDashboardReqModel extends Equatable {
  final String fromData;
  final String toDate;
  const CustomDashboardReqModel({required this.fromData, required this.toDate});

  @override
  List<Object?> get props => [fromData, toDate];

  Map<String, dynamic> toMap() {
    return {"fromData": fromData, "toDate": toDate};
  }
}
