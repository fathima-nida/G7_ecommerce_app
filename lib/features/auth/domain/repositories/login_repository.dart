import 'package:g7_comerce_app/core/common/generic_types.dart';
import 'package:g7_comerce_app/features/auth/domain/model/login_request_model.dart';
import 'package:g7_comerce_app/features/auth/domain/model/login_response.dart';

abstract class LoginRepository {
  FutureEither<LoginResponseModel> LoginAuth(LoginRequestModel reqModel);
}
