import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:g7_comerce_app/core/build_config/build_config.dart';
import 'package:g7_comerce_app/domain/auth/models/login_request_model.dart';
import 'package:g7_comerce_app/domain/auth/models/login_response.dart';
import 'package:g7_comerce_app/domain/auth/repositories/login_repository.dart';
import 'package:g7_comerce_app/presentation/bloc/auth/auth_event.dart';
import 'package:g7_comerce_app/presentation/bloc/auth/auth_state.dart';
import 'package:g7_comerce_app/utils/shared_pref_helper/shared_pref_helper.dart';



class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository repository;

  LoginBloc(this.repository) : super(LoginInitial()) {
    on<LoginWithMobileEvent>(_onLoginWithMobile);
    on<checkLoginStatus>(_checkLoginStatus);
  on<LogoutApp>(logout);
  }

  Future<void> _onLoginWithMobile(
    LoginWithMobileEvent event,
    Emitter<LoginState> emit,
  ) async {
    log("fffffffffffffffff  ${event.mobile}");
    emit(LoginLoading());

    final request = LoginRequestModel(mobile: event.mobile);

    final result = await repository.loginAuth(request);

    log("loginAuth result is... : $result");

    result.fold(
      (failure) {
        emit(LoginFailure(failure.message));
      },
      (response) {
//        if (response.token.isNotEmpty) {
//   await SharedPrefHelper.saveAppToken(response.token);

//   final saved = await SharedPrefHelper.getAppToken();
//   print("✅ TOKEN SAVED SUCCESSFULLY: $saved");
// }

       emit(LoginSuccess(response));
      },
    );
      // async work OUTSIDE fold
  if (result.isRight()) {
    final response = result.getOrElse(() => LoginResponseModel(token: "", expiration: "", otpCode: ""));
    if (response != null && response.token.isNotEmpty) {
      await SharedPrefHelper.saveAppToken(response.token);
    }
  }
  }
  Future<void>_checkLoginStatus(
    checkLoginStatus event,
    Emitter<LoginState>emit,

  )async{
emit(LoginLoading());
final baseUrl=await SharedPrefHelper.getBaseUrl();
final token=await SharedPrefHelper.getAppToken();
log("checking Login=>BaseUrl:$baseUrl|token:$token");
if(baseUrl==null|| baseUrl.isEmpty){
  emit(ShowAuthPage());
  return ;
}
if(token==null||token.isEmpty){
  emit(ShowAuthPage());
  return;
}
emit(AuthLoggedIn());
  }
  Future<void>logout(LogoutApp event,Emitter<LoginState>emit)async{
    await SharedPrefHelper.clearAppToken();
    BuildConfig.appToken="";
  emit(LogoutSuccess());
  }

}
