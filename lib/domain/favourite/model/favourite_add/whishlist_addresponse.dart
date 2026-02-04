import 'package:equatable/equatable.dart';

class WishlistActionResponse extends Equatable {
  final bool status;
  final int statusCode;
  final String message;
  final dynamic data; 

  const WishlistActionResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    this.data,
  });

  factory WishlistActionResponse.fromMap(Map<String, dynamic> map) {
    return WishlistActionResponse(
      status: map['status'] ?? false,
      statusCode: map['statusCode'] ?? 0,
      message: map['message'] ?? '',
      data: map['data'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'statusCode': statusCode,
      'message': message,
      'data': data,
    };
  }

  @override
  List<Object?> get props => [status, statusCode, message, data];
}
