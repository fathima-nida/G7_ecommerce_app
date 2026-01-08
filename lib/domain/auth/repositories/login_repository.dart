import 'package:g7_comerce_app/domain/common/generic_types.dart';
import 'package:g7_comerce_app/domain/auth/models/login_request_model.dart';
import 'package:g7_comerce_app/domain/auth/models/login_response.dart';

abstract class LoginRepository {
  FutureEither<LoginResponseModel> loginAuth(LoginRequestModel reqModel);
}
