import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g7_comerce_app/core/build_config/build_config.dart';
import 'package:g7_comerce_app/domain/auth/models/login_request_model.dart';
import 'package:g7_comerce_app/domain/auth/models/otp_request_model.dart';
import 'package:g7_comerce_app/domain/auth/models/otp_response_model.dart';
import 'package:g7_comerce_app/domain/auth/repositories/login_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:g7_comerce_app/utils/shared_pref_helper/shared_pref_helper.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository repository;

  LoginBloc(this.repository) : super(LoginInitial()) {
    on<LoginWithMobileEvent>(_onLoginWithMobile);
    on<VerifyOtpEvent>(_onVerifyOtp);
    on<CheckLoginStatusEvent>(_checkLoginStatus);
    on<LogoutApp>(_onLogout);
  }

  // ----------------------------
  // LOGIN WITH MOBILE
  // ----------------------------
  Future<void> _onLoginWithMobile(
      LoginWithMobileEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    final request = LoginRequestModel(mobile: event.mobile);
    final result = await repository.loginAuth(request);

    await result.fold(
      (failure) async {
        if (!emit.isDone) emit(LoginFailure(failure.message));
      },
      (response) async {
        if (response.token.isNotEmpty) {
          await SharedPrefHelper.saveAppToken(response.token);
          BuildConfig.appToken = response.token;
          log("✅ Token stored: ${response.token}", name: "LOGIN");
        }
        if (!emit.isDone) emit(LoginSuccess(response));
      },
    );
  }

  // ----------------------------
  // OTP VERIFICATION
  // ----------------------------
  Future<void> _onVerifyOtp(
      VerifyOtpEvent event, Emitter<LoginState> emit) async {
    emit(OtpVerifyLoading());

    final token = await SharedPrefHelper.getAppToken();
    if (token == null || token.isEmpty) {
      if (!emit.isDone)
        emit(OtpVerifyFailure("Token not found. Please login again."));
      return;
    }

    final request = OtpRequestModel(otp: event.otp);
    final result = await repository.verifyOtp(request);

    await result.fold(
      (failure) async {
        if (!emit.isDone) emit(OtpVerifyFailure(failure.message));
      },
      (otpResponse) async {
        await SharedPrefHelper.saveLedgerId(otpResponse.ledgerId.toString());
        await SharedPrefHelper.saveUserName(otpResponse.ledgerName);
        await SharedPrefHelper.saveUserRole(otpResponse.role);
        await SharedPrefHelper.saveProfileImage(otpResponse.profileImage);

        if (!emit.isDone) emit(OtpVerifySuccess(otpResponse));
      },
    );
  }

  // ----------------------------
  // CHECK LOGIN STATUS
  // ----------------------------
  Future<void> _checkLoginStatus(
      CheckLoginStatusEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    final baseUrl = await SharedPrefHelper.getBaseUrl();
    final token = await SharedPrefHelper.getAppToken();
    final ledgerId = await SharedPrefHelper.getLedgerId();
    final name = await SharedPrefHelper.getUserName();
    final role = await SharedPrefHelper.getUserRole();
    final image = await SharedPrefHelper.getProfileImage();

    BuildConfig.appToken = token ?? "";
    log("Checking login => BaseUrl: $baseUrl | Token: $token");

    if (baseUrl == null || baseUrl.isEmpty || token == null || token.isEmpty || ledgerId == null) {
      if (!emit.isDone) emit(ShowAuthPage());
      return;
    }

    final user = OtpResponseModel(
      userId: 0,
      mobileNo: '',
      role: role ?? '',
      ledgerId: int.parse(ledgerId),
      ledgerName: name ?? '',
      profileImage: image ?? '',
      areas: const [],
      routes: const [],
    );

    if (!emit.isDone) emit(AuthLoggedIn(user));
  }

  // ----------------------------
  // LOGOUT
  // ----------------------------
  Future<void> _onLogout(LogoutApp event, Emitter<LoginState> emit) async {
    await SharedPrefHelper.clearAppToken();
    await SharedPrefHelper.clearUserData();
    BuildConfig.appToken = "";

    log("[LoginBloc] User logged out, token cleared");
    if (!emit.isDone) emit(LogoutSuccess());
  }
}
