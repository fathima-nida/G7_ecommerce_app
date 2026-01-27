import 'package:equatable/equatable.dart';
import 'package:g7_comerce_app/domain/auth/models/login_response.dart';
import 'package:g7_comerce_app/domain/auth/models/otp_response_model.dart';

abstract class LoginState extends Equatable {
  final OtpResponseModel? user;

  const LoginState({this.user});

  @override
  List<Object?> get props => [user];
}

/// Initial state
class LoginInitial extends LoginState {
  const LoginInitial({OtpResponseModel? user}) : super(user: user);
}

/// Loading states
class LoginLoading extends LoginState {}
class OtpVerifyLoading extends LoginState {}

/// Login success (after sending OTP)
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

/// OTP verified successfully
class OtpVerifySuccess extends LoginState {
  const OtpVerifySuccess(OtpResponseModel user) : super(user: user);
}

/// OTP verification failed
class OtpVerifyFailure extends LoginState {
  final String message;

  const OtpVerifyFailure(this.message);

  @override
  List<Object?> get props => [message];
}

/// Authenticated user (already logged in)
class AuthLoggedIn extends LoginState {
  const AuthLoggedIn(OtpResponseModel user) : super(user: user);
}

/// Logged out
class LogoutSuccess extends LoginState {}

/// Show login/auth screen
class ShowAuthPage extends LoginState {}

/// Token expired (optional)
class TokenExpiredState extends LoginState {}
