import 'package:equatable/equatable.dart';

class CommonResponseModel extends Equatable {
  final bool status;
  final int statusCode;
  final String message;

  const CommonResponseModel({
    required this.status,
    required this.statusCode,
    required this.message,
  });

  factory CommonResponseModel.fromMap(Map<String, dynamic> map) {
    return CommonResponseModel(
      status: map['status'] ?? false,
      statusCode: map['statusCode'] ?? 0,
      message: map['message'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'statusCode': statusCode,
      'message': message,
    };
  }

  @override
  List<Object?> get props => [status, statusCode, message];
}
