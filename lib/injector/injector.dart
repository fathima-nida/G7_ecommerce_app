import 'package:dartz/dartz.dart';
import 'package:g7_comerce_app/data/cart/cart_implementation/cart_implementation.dart';
import 'package:g7_comerce_app/data/dashboard/repository_implementation/cstmr_dashboard_impl.dart';
import 'package:g7_comerce_app/data/home/home_repository_impl/banner_repo_impl.dart';
import 'package:g7_comerce_app/data/home/home_repository_impl/category_repo_impl.dart';
import 'package:g7_comerce_app/data/home/home_repository_impl/search_repository_imp.dart';
import 'package:g7_comerce_app/data/home/home_repository_impl/sec_newarrival_repo_impl.dart';
import 'package:g7_comerce_app/data/dashboard/repository_implementation/order_view_repository_imp.dart';
import 'package:g7_comerce_app/data/dashboard/repository_implementation/sales_order_repository_imp.dart';
import 'package:g7_comerce_app/domain/cart/repositories/cart_repo.dart';
import 'package:g7_comerce_app/data/favourite/implementation/favourite_repository_impl.dart';
import 'package:g7_comerce_app/data/product/implementation/product_impl.dart';
import 'package:g7_comerce_app/domain/category/repositories/product_repository.dart';
import 'package:g7_comerce_app/domain/dashboard/repositories/custom_dashboard_repo.dart';
import 'package:g7_comerce_app/domain/favourite/repository/favourite_repository.dart';
import 'package:g7_comerce_app/domain/home/repository/banner_repository.dart';
import 'package:g7_comerce_app/domain/home/repository/category_repository.dart';
import 'package:g7_comerce_app/domain/home/repository/search_repository.dart';
import 'package:g7_comerce_app/domain/home/repository/sec_newarrival_repository.dart';
import 'package:g7_comerce_app/domain/dashboard/repositories/order_view_repository.dart';
import 'package:g7_comerce_app/domain/dashboard/repositories/sales_orders_repository.dart';
import 'package:g7_comerce_app/presentation/bloc/cart/bloc/cart_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/dashboard/customer_dashboard/cstmr_dashboard_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/dashboard/order_view/order_view_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/dashboard/sales_ordes/bloc/sales_orders_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/home/banner/banner_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/home/categorylist/category_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/home/sec_newarrival/search_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/home/sec_newarrival/section_newarrival_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/favourite/favourite_bloc.dart';
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
  getit.registerSingleton<SalesOrdersRepository>(SalesOrderRepositoryImp());
  getit.registerSingleton<OrderViewRepository>(OrderViewRepositoryImp());
  getit.registerSingleton<SecNewarrivalRepository>(SecNewarrivalRepositoryImp());
  getit.registerSingleton<BannerRepository>(BannerRepoImpl());
  getit.registerSingleton<CategoryRepository>(CategoryRepoImpl());
  getit.registerSingleton<CartRepo>(CartImplementation());
   getit.registerSingleton<FavouriteRepository>(FavouriteRepositoryImpl());
  getit.registerSingleton<SearchRepository>(SearchRepositoryImp());
  getit.registerSingleton<ProductRepository>(ProductImpl());

  /// =========================
  /// Bloc
  /// =========================
  getit.registerFactory<LoginBloc>(() => LoginBloc(getit<LoginRepository>()));
  getit.registerFactory<CstmrDashboardBloc>(
    () => CstmrDashboardBloc(getit<CstmrDashboardRepo>()),
  );
  getit.registerFactory<SalesOrdersBloc>(
    () => SalesOrdersBloc(getit<SalesOrdersRepository>()),
  );
  getit.registerFactory<OrderViewBloc>(
    () => OrderViewBloc(getit<OrderViewRepository>()),
  );
  getit.registerFactory<SecNewarrivalBloc>(()=>SecNewarrivalBloc(getit<SecNewarrivalRepository>()));
  getit.registerFactory<BannerBloc>(()=>BannerBloc(getit<BannerRepository>()));
  getit.registerFactory<CategoryBloc>(()=>CategoryBloc(getit<CategoryRepository>()));
  getit.registerFactory<CartBloc>(()=>CartBloc(getit<CartRepo>()));
  getit.registerFactory<SearchBloc>(()=>SearchBloc(getit<SearchRepository>()));

  getit.registerCachedFactory<FavouriteBloc>(()=>FavouriteBloc(getit<FavouriteRepository>()));
  getit.registerCachedFactory<ProductDetailsBloc>(()=>ProductDetailsBloc(getit<ProductRepository>()));
   
}
