import 'package:dartz/dartz.dart';
import 'package:g7_comerce_app/data/dashboard/repository_implementation/cstmr_dashboard_impl.dart';
import 'package:g7_comerce_app/data/dashboard/repository_implementation/order_view_repository_imp.dart';
import 'package:g7_comerce_app/data/dashboard/repository_implementation/sales_order_repository_imp.dart';
import 'package:g7_comerce_app/domain/dashboard/repositories/custom_dashboard_repo.dart';
import 'package:g7_comerce_app/domain/dashboard/repositories/order_view_repository.dart';
import 'package:g7_comerce_app/domain/dashboard/repositories/sales_orders_repository.dart';
import 'package:g7_comerce_app/presentation/bloc/dashboard/customer_dashboard/cstmr_dashboard_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/dashboard/order_view/order_view_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/dashboard/sales_ordes/bloc/sales_orders_bloc.dart';
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
}
