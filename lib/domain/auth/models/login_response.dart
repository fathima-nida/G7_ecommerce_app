import 'package:equatable/equatable.dart';
import 'package:g7_comerce_app/domain/common/common_response_model.dart';

class LoginResponseModel extends CommonResponseModel {
  final String token;
  final String expiration;
  final String otpCode;

  const LoginResponseModel({
    required super.status,
    required super.statusCode,
    required super.message,
    required this.token,
    required this.expiration,
    required this.otpCode,
  });

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      status: map['status'] ?? false,
      statusCode: map['statusCode'] ?? 0,
      message: map['message'] ?? '',
      token: map['token'] ?? '',
      expiration: map['expiration'] ?? '',
      otpCode: map['otpCode'] ?? '',
    );
  }

  factory LoginResponseModel.dummy() {
    return const LoginResponseModel(
      status: false,
      statusCode: 0,
      message: '',
      token: '',
      expiration: '',
      otpCode: '',
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      ...super.toMap(),
      'token': token,
      'expiration': expiration,
      'otpCode': otpCode,
    };
  }

  @override
  List<Object?> get props =>
      super.props + [token, expiration, otpCode];

  LoginResponseModel copyWith({
    bool? status,
    int? statusCode,
    String? message,
    String? token,
    String? expiration,
    String? otpCode,
  }) {
    return LoginResponseModel(
      status: status ?? this.status,
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      token: token ?? this.token,
      expiration: expiration ?? this.expiration,
      otpCode: otpCode ?? this.otpCode,
    );
  }
}
