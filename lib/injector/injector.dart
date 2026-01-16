import 'package:g7_comerce_app/data/services/favourite_api.dart';
import 'package:g7_comerce_app/data/services/product_api.dart';
import 'package:g7_comerce_app/domain/cart/repositories/product_repo.dart';
import 'package:g7_comerce_app/domain/repositories/favourite_repository.dart';
import 'package:g7_comerce_app/domain/repositories/favourite_repository_impl.dart';
import 'package:g7_comerce_app/presentation/bloc/favourite/favourite_bloc.dart';
import 'package:g7_comerce_app/data/dashboard/ctmr_dashboard_impl/cstmr_dashboard_impl.dart';
import 'package:g7_comerce_app/domain/dashboard/repositories/custom_dashboard_repo.dart';
import 'package:g7_comerce_app/presentation/bloc/dashboard/cstmr_dashboard_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/product/product_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:g7_comerce_app/data/auth/auth_repository_impl/auth_repository_imp.dart';
import 'package:g7_comerce_app/domain/auth/repositories/login_repository.dart';
import 'package:g7_comerce_app/presentation/bloc/auth/auth_bloc.dart';

final getit = GetIt.instance;

void setup() {
  /// =========================
  /// Repository
  /// =========================
  getit.registerSingleton<LoginRepository>(AuthRepositoryImp());
  getit.registerSingleton<CstmrDashboardRepo>(CstmrDashboardImpl());
   getit.registerLazySingleton<FavouriteApi>(() => FavouriteApi());
   getit.registerLazySingleton<FavouriteRepository>(() => FavouriteRepositoryImpl(getit<FavouriteApi>()));
   getit.registerLazySingleton<ProductApi>(() => ProductApi());
   getit.registerLazySingleton<ProductRepository>(() => ProductRepository(getit()));
  /// =========================
  /// Bloc
  /// =========================
  getit.registerFactory<LoginBloc>(() => LoginBloc(getit<LoginRepository>()));
   getit.registerFactory<FavouriteBloc>(
    () => FavouriteBloc(getit<FavouriteRepository>()),
  );
  getit.registerFactory<CstmrDashboardBloc>(()=>CstmrDashboardBloc(getit<CstmrDashboardRepo>()));
   getit.registerFactory<ProductBloc>(() => ProductBloc(getit()));
   
}
