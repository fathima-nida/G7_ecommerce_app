import 'package:get_it/get_it.dart';

import 'package:g7_comerce_app/data/auth/auth_repository_impl/auth_repository_imp.dart';
import 'package:g7_comerce_app/domain/auth/repositories/login_repository.dart';
import 'package:g7_comerce_app/presentation/bloc/auth/auth_bloc.dart';

final getit = GetIt.instance;

void setup() {
  /// =========================
  /// Repository
  /// =========================
  /// 
  getit.registerSingleton<LoginRepository>(
    AuthRepositoryImp(),
  );

  /// =========================
  /// Bloc
  /// =========================
  getit.registerFactory<LoginBloc>(
  () => LoginBloc(getit<LoginRepository>()),
);

}

