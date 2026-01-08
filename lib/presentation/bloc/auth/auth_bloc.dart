import 'package:bloc/bloc.dart';
import 'package:g7_comerce_app/domain/auth/models/login_request_model.dart';
import 'package:g7_comerce_app/domain/auth/repositories/login_repository.dart';
import 'package:g7_comerce_app/presentation/bloc/auth/auth_event.dart';
import 'package:g7_comerce_app/presentation/bloc/auth/auth_state.dart';
import 'package:g7_comerce_app/utils/shared_pref_helper/shared_pref_helper.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository repository;

  LoginBloc(this.repository) : super(LoginInitial()) {
    on<LoginWithMobileEvent>(_onLoginWithMobile);
  }

  Future<void> _onLoginWithMobile(
    LoginWithMobileEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    final request = LoginRequestModel(mobile: event.mobile);

    final result = await repository.loginAuth(request);

    result.fold(
      (failure) {
        emit(LoginFailure(failure.message));
      },
      (response)async {
       if (response.token.isNotEmpty) {
  await SharedPrefHelper.saveAppToken(response.token);

  final saved = await SharedPrefHelper.getAppToken();
  print("✅ TOKEN SAVED SUCCESSFULLY: $saved");
}

       emit(LoginSuccess(response));
      },
    );
  }
}
