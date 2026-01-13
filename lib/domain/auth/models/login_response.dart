import 'package:equatable/equatable.dart';
import 'package:g7_comerce_app/domain/common/common_response_model.dart';

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
      token: map ['token'] ?? '',
      expiration: map['expiration'] ?? '',
      otpCode: map['otpCode'] ?? '',
    );
  }

  factory LoginResponseModel.dummy() {
    return const LoginResponseModel(
      token: '',
      expiration: '',
      otpCode: '',
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'expiration': expiration,
      'otpCode': otpCode,
    };
  }

  @override
  List<Object?> get props =>  //super.props + 
  [token, expiration, otpCode];

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
