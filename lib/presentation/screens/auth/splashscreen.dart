import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g7_comerce_app/core/theme/app_colors.dart';
import 'package:g7_comerce_app/core/theme/asset_resources.dart';
import 'package:g7_comerce_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/auth/auth_event.dart';
import 'package:g7_comerce_app/presentation/bloc/auth/auth_state.dart';
import 'package:g7_comerce_app/presentation/screens/auth/loginscreen.dart';
import 'package:g7_comerce_app/presentation/widgets/bottom_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<LoginBloc>().add(CheckLoginStatusEvent());
    //  Future.delayed(Duration(seconds: 2),(){
    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    //  }
    //  );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if(state is ShowAuthPage){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
        }
      else if(state is AuthLoggedIn){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigationWidget()));
      }
        // TODO: implement listener
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Center(child: Image.asset(AssetResources.logo, scale: 4)),
      ),
    );
  }
}
