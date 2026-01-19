import 'package:g7_comerce_app/data/dashboard/ctmr_dashboard_impl/cstmr_dashboard_impl.dart';
import 'package:g7_comerce_app/data/home/home_repository_impl/banner_repo_impl.dart';
import 'package:g7_comerce_app/data/home/home_repository_impl/category_repo_impl.dart';
import 'package:g7_comerce_app/data/home/home_repository_impl/sec_newarrival_repo_impl.dart';
import 'package:g7_comerce_app/domain/dashboard/repositories/custom_dashboard_repo.dart';
import 'package:g7_comerce_app/domain/home/repository/banner_repository.dart';
import 'package:g7_comerce_app/domain/home/repository/category_repository.dart';
import 'package:g7_comerce_app/domain/home/repository/sec_newarrival_repository.dart';
import 'package:g7_comerce_app/presentation/bloc/dashboard/cstmr_dashboard_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/home/banner/banner_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/home/categorylist/category_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/home/sec_newarrival/section_newarrival_bloc.dart';
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
  getit.registerSingleton<SecNewarrivalRepository>(SecNewarrivalRepositoryImp());
  getit.registerSingleton<BannerRepository>(BannerRepoImpl());
  getit.registerSingleton<CategoryRepository>(CategoryRepoImpl());
 
  

  /// =========================
  /// Bloc
  /// =========================
  getit.registerFactory<LoginBloc>(() => LoginBloc(getit<LoginRepository>()));
  getit.registerFactory<CstmrDashboardBloc>(()=>CstmrDashboardBloc(getit<CstmrDashboardRepo>()));
  getit.registerFactory<SecNewarrivalBloc>(()=>SecNewarrivalBloc(getit<SecNewarrivalRepository>()));
  getit.registerFactory<BannerBloc>(()=>BannerBloc(getit<BannerRepository>()));
  getit.registerFactory<CategoryBloc>(()=>CategoryBloc(getit<CategoryRepository>()));

}
