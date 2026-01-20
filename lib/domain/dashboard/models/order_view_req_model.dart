import 'package:equatable/equatable.dart';

class OrderViewReqModel extends Equatable {
  final int orderId;
 

  const OrderViewReqModel({
    required this.orderId,
  });

  @override
  List<Object?> get props => [orderId];
  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
    };
  }


}
