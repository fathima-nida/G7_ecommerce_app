// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class LoginResponseModel extends Equatable {
  final String token;
  final String expiration;
  final String otpCode;

  const LoginResponseModel({
    required this.token,
    required this.expiration,
    required this.otpCode,
  });
  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      token: map['token'],
      expiration: map['expiration'],
      otpCode: map['otpCode'],
    );
  }

  factory LoginResponseModel.dummy() {
    return LoginResponseModel(
      token: '',
      expiration: '',
      otpCode: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'expiration': expiration,
      'otpCode': otpCode,
    };
  }

  @override
  List<Object?> get props => [token, expiration,  otpCode];

  LoginResponseModel copyWith({
    String? token,
    String? expiration,
   
    String? otpCode,
  }) {
    return LoginResponseModel(
      token: token ?? this.token,
      expiration: expiration ?? this.expiration,
      otpCode: otpCode ?? this.otpCode,
    );
  }
}