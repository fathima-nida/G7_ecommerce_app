
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g7_comerce_app/core/build_config/build_config.dart';
import 'package:g7_comerce_app/domain/auth/models/login_request_model.dart';
import 'package:g7_comerce_app/domain/auth/models/login_response.dart';
import 'package:g7_comerce_app/domain/auth/models/otp_request_model.dart';
import 'package:g7_comerce_app/domain/auth/repositories/login_repository.dart';
import 'package:g7_comerce_app/presentation/bloc/auth/auth_event.dart';
import 'package:g7_comerce_app/presentation/bloc/auth/auth_state.dart';
import 'package:g7_comerce_app/utils/shared_pref_helper/shared_pref_helper.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository repository;

  LoginBloc(this.repository) : super(LoginInitial()) {
    on<LoginWithMobileEvent>(_onLoginWithMobile);
    on<VerifyOtpEvent>(_onVerifyOtp);
    on<checkLoginStatus>(_checkLoginStatus);
    on<LogoutApp>(logout);
  }

  

  // Future<void> _onLoginWithMobile(
  //   LoginWithMobileEvent event,
  //   Emitter<LoginState> emit,
  // ) async {
  //   log("fffffffffffffffff  ${event.mobile}");
  //   emit(LoginLoading());

  //   final request = LoginRequestModel(mobile: event.mobile);
  //   log('login auth...............:$request');
  //   final result = await repository.loginAuth(request);

  //   log("loginAuth result is... : $result");

  //   result.fold(
  //     (failure) {
  //       emit(LoginFailure(failure.message));
  //     },
  //     (response) async {
  //              if (response.token.isNotEmpty) {
  //         await SharedPrefHelper.saveAppToken(response.token);
  //          BuildConfig.appToken = response.token;
  //         final saved = await SharedPrefHelper.getAppToken();
  //         print("✅ TOKEN SAVED SUCCESSFULLY: $saved");
  //       }

  //       emit(LoginSuccess(response));
  //     },
  //   );
  //   // // async work OUTSIDE fold
  //   // if (result.isRight()) {
  //   //   final response = result.getOrElse(
  //   //     () => LoginResponseModel(token: "", expiration: "", otpCode: ""),
  //   //   );
  //   //   if (response != null && response.token.isNotEmpty) {
  //   //     await SharedPrefHelper.saveAppToken(response.token);
  //   //   }
  //   // }
  // }


     Future<void> _onLoginWithMobile(
  LoginWithMobileEvent event,
  Emitter<LoginState> emit,
) async {
  emit(LoginLoading());

  final request = LoginRequestModel(mobile: event.mobile);
  final result = await repository.loginAuth(request);

  if (emit.isDone) return;

  await result.fold(
    (failure) async {
      emit(LoginFailure(failure.message));
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
    VerifyOtpEvent event,
    Emitter<LoginState> emit,
  ) async {
    log("[LoginBloc] Verifying OTP: ${event.otp}");
    emit(OtpVerifyLoading());

    final token = await SharedPrefHelper.getAppToken();
    if (token == null || token.isEmpty) {
      emit(OtpVerifyFailure("Token not found. Please login again."));
      return;
    }
    log("$token",name: "Login token here");

    final request = OtpRequestModel(otp: event.otp);
    log("[LoginBloc] Request: $request");
    final result = await repository.verifyOtp(request);
    log("[LoginBloc] Result: $result");

    result.fold(
      (failure) {
        emit(OtpVerifyFailure(failure.message));
      },
      (otpResponse) {
        // OTP response does NOT contain a token
        // Just emit success with user data
        emit(OtpVerifySuccess(otpResponse));
      },
    );
  }

  // ----------------------------
  // CHECK LOGIN STATUS
  // ----------------------------
  Future<void> _checkLoginStatus(
    checkLoginStatus event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    final baseUrl = await SharedPrefHelper.getBaseUrl();
    final token = await SharedPrefHelper.getAppToken();
    BuildConfig.appToken = token ?? "";   //adding by nida
    log("checking Login=>BaseUrl:$baseUrl|token:$token");
    if (baseUrl == null || baseUrl.isEmpty) {
      emit(ShowAuthPage());
      return;
    }
    if (token == null || token.isEmpty) {
      emit(ShowAuthPage());
      return;
    }
    emit(AuthLoggedIn());
  }

  Future<void> logout(LogoutApp event, Emitter<LoginState> emit) async {
    await SharedPrefHelper.clearAppToken();
    BuildConfig.appToken = "";
    emit(LogoutSuccess());
  }

  // ----------------------------
  // LOGOUT
  // ----------------------------
  Future<void> _onLogout(LogoutApp event, Emitter<LoginState> emit) async {
    await SharedPrefHelper.clearAppToken();
    BuildConfig.appToken = "";

    log("[LoginBloc] User logged out, token cleared");
    emit(LogoutSuccess());
  }
}
