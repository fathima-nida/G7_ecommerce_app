import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

/// Triggered when user taps Login button
class LoginWithMobileEvent extends LoginEvent {
  final String mobile;

  const LoginWithMobileEvent(this.mobile);

  @override
  List<Object?> get props => [mobile];
}

/// Triggered when user submits OTP
class VerifyOtpEvent extends LoginEvent {
  final String otp;

  const VerifyOtpEvent(this.otp);

  @override
  List<Object?> get props => [otp];
}

/// Check if user is already logged in
class CheckLoginStatusEvent extends LoginEvent {}

/// Logout user
class LogoutApp extends LoginEvent {}
