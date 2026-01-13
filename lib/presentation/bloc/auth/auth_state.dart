import 'package:equatable/equatable.dart';
import 'package:g7_comerce_app/domain/auth/models/login_response.dart';
import 'package:g7_comerce_app/domain/auth/models/otp_response_model.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

/// Initial screen state
class LoginInitial extends LoginState {}

/// While API is loading
class LoginLoading extends LoginState {}

/// Login success → OTP sent
class LoginSuccess extends LoginState {
  final LoginResponseModel response;

  const LoginSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

/// Login failed
class LoginFailure extends LoginState {
  final String message;

  const LoginFailure(this.message);

  @override
  List<Object?> get props => [message];
}
class  ShowAuthPage extends LoginState{}
class AuthLoggedIn extends LoginState{}
final class TokenExpiredState extends LoginState{}
final class LogoutSuccess extends LoginState{}

/// While OTP verification is in progress
class OtpVerifyLoading extends LoginState {}

/// OTP verified successfully
class OtpVerifySuccess extends LoginState {
  final OtpResponseModel user;

  const OtpVerifySuccess(this.user);

  @override
  List<Object?> get props => [user];
}

/// OTP verification failed
class OtpVerifyFailure extends LoginState {
  final String message;

  const OtpVerifyFailure(this.message);

  @override
  List<Object?> get props => [message];
}
