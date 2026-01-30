import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g7_comerce_app/core/build_config/app_env.dart';
import 'package:g7_comerce_app/core/build_config/build_config.dart';
import 'package:g7_comerce_app/core/constants/api_endpoints.dart';
import 'package:g7_comerce_app/data/favourite/implementation/favourite_repository_impl.dart';
import 'package:g7_comerce_app/injector/injector.dart' as di;
import 'package:g7_comerce_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/cart/bloc/cart_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/dashboard/customer_dashboard/cstmr_dashboard_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/home/banner/banner_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/home/categorylist/category_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/home/sec_newarrival/search_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/home/sec_newarrival/section_newarrival_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/favourite/favourite_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/product/product_bloc.dart';
import 'package:g7_comerce_app/presentation/screens/auth/splashscreen.dart';
import 'package:g7_comerce_app/utils/shared_pref_helper/shared_pref_helper.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  di.setup();
   String? savedBaseUrl = await SharedPrefHelper.getBaseUrl();
  savedBaseUrl ??= ApiEndpoints.baseUrl;
  await SharedPrefHelper.saveBaseUrl(savedBaseUrl);

  await BuildConfig.initialize(
    environment: AppEnv.developer,
    baseUrl: savedBaseUrl,
    timeOut: const Duration(seconds: 15),
    isDeveloperWindowEnabled: true,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MultiBlocProvider(
      providers: [
      BlocProvider<LoginBloc>(create: (_)=>di.getit.get<LoginBloc>()),
      BlocProvider<CstmrDashboardBloc>(create: (_)=>di.getit.get<CstmrDashboardBloc>()),
      BlocProvider(create: (_) => FavouriteBloc(FavouriteRepositoryImpl())),
      BlocProvider<ProductDetailsBloc>(create: (_) => di.getit.get<ProductDetailsBloc>()),
      BlocProvider<CartBloc>(create: (_)=>di.getit.get<CartBloc>()),
      BlocProvider<BannerBloc>(create: (_)=>di.getit.get<BannerBloc>()),
      BlocProvider<CategoryBloc>(create: (_)=>di.getit.get<CategoryBloc>()),
      BlocProvider<SecNewarrivalBloc>(create: (_)=>di.getit.get<SecNewarrivalBloc>()),
      BlocProvider<BannerBloc>(create: (_)=>di.getit.get<BannerBloc>()),
      BlocProvider<CategoryBloc>(create: (_)=>di.getit.get<CategoryBloc>()),
      BlocProvider<SearchBloc>(create: (_)=>di.getit.get<SearchBloc>()),
  ],
      
       
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home:SplashScreen(),
      ),
    );
  }
}

     