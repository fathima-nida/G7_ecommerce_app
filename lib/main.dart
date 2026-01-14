import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g7_comerce_app/core/build_config/app_env.dart';
import 'package:g7_comerce_app/core/build_config/build_config.dart';
import 'package:g7_comerce_app/core/constants/api_endpoints.dart';
import 'package:g7_comerce_app/injector/injector.dart' as di;
import 'package:g7_comerce_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/dashboard/bloc/cstmr_dashboard_bloc.dart';
import 'package:g7_comerce_app/presentation/screens/auth/splashscreen.dart';
import 'package:g7_comerce_app/presentation/screens/home/product%20view.dart';

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
      
      ],
        
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home:SplashScreen(),
      ),
    );
  }
}
