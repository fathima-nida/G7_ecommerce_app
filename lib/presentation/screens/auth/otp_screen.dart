import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g7_comerce_app/core/theme/app_colors.dart';
import 'package:g7_comerce_app/core/theme/asset_resources.dart';
import 'package:g7_comerce_app/core/theme/textstyle.dart';
import 'package:g7_comerce_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/auth/auth_event.dart';
import 'package:g7_comerce_app/presentation/bloc/auth/auth_state.dart';
import 'package:g7_comerce_app/presentation/widgets/bottom_navigation.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => OtpScreenState();
}

class OtpScreenState extends State<OtpScreen> {
  
  final TextEditingController otpController = TextEditingController();

  
  OverlayEntry? topOtpOverlay;

  @override
  void initState() {
    super.initState();

    // Show top OTP box after screen builds
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showTopOtpBox();
    });
  }

  // Show floating box at top
  void showTopOtpBox() {
    topOtpOverlay = OverlayEntry(
      builder: (overlayContext) => Positioned(
        top: 50,
        left: 16,
        right: 16,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.lighteGrey,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "OTP received. Click ok to proceed",
                    style: AppTextstyle.medium(),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Remove the top box
                    topOtpOverlay?.remove();
                    topOtpOverlay = null;

                   
                    otpController.text = "000000";

                    
                    context.read<LoginBloc>().add(
                      VerifyOtpEvent("000000"),
                    );
                  },
                  child: const Text("OK",),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context)?.insert(topOtpOverlay!);
      Future.delayed(const Duration(seconds: 40), () {
    if (topOtpOverlay != null) {
      topOtpOverlay?.remove();
      topOtpOverlay = null;
    }
  });
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is OtpVerifyLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (dialogContext) =>
                  const Center(child: CircularProgressIndicator()),
            );
          } else if (state is OtpVerifySuccess) {
            Navigator.of(context, rootNavigator: true).pop();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (screenContext) => const BottomNavigationWidget(),
              ),
            );
          } else if (state is OtpVerifyFailure) {
            Navigator.of(context, rootNavigator: true).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              Center(
                child: Image.asset(
                  AssetResources.logo,
                  scale: 6,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  "Enter Your OTP Number",
                  style: AppTextstyle.large(),
                ),
              ),
              const SizedBox(height: 90),

              // Pinput
              Pinput(
                controller: otpController,
                length: 6,
                keyboardType: TextInputType.number,
                onCompleted: (pin) {
                  context.read<LoginBloc>().add(
                    VerifyOtpEvent(pin),
                  );
                },
                defaultPinTheme: PinTheme(
                  width: 55,
                  height: 55,
                  textStyle: AppTextstyle.large(),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  height: 60,
                  width: 60,
                  textStyle: AppTextstyle.large(),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
