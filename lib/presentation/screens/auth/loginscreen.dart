import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g7_comerce_app/core/theme/app_colors.dart';
import 'package:g7_comerce_app/core/theme/asset_resources.dart';
import 'package:g7_comerce_app/core/theme/textstyle.dart';
import 'package:g7_comerce_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/auth/auth_event.dart';
import 'package:g7_comerce_app/presentation/bloc/auth/auth_state.dart';
import 'package:g7_comerce_app/presentation/screens/auth/otp_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool showPassword = true;

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController mobilecontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    mobilecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 80),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => OtpScreen()),
                  );
                }
                if (state is LoginFailure) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                }
                // TODO: implement listener
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(AssetResources.logo, height: 77),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Sign in to your Account",
                      style: AppTextstyle.large(),
                    ),
                    Text(
                      "Enter your mobile number to login",
                      style: AppTextstyle.small(fontColor: AppColors.grey),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Mobile number",
                      style: AppTextstyle.small(fontColor: AppColors.grey),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: mobilecontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your Mobile number";
                        }
                        if (value.length != 10) {
                          return "Mobile number must be 10 digits";
                        }
                      },
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        label: Text(
                          "Enter your Mobile number",
                          style: AppTextstyle.small(fontColor: AppColors.grey),
                        ),
                        prefixIcon: Icon(
                          Icons.phone,
                          size: 27,
                          color: AppColors.pink,
                        ),
                      ),
                    ),

                    SizedBox(height: 70),

                    Center(
                      child: state is LoginLoading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.pink,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    10,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                   context.read<LoginBloc>().add(
                                    LoginWithMobileEvent(
                                      mobilecontroller.text.trim(),
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                width: 274,
                                height: 51,
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: AppTextstyle.medium(
                                      fontColor: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
