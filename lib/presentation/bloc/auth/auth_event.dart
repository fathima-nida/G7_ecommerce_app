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
