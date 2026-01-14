// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:g7_comerce_app/core/theme/asset_resources.dart';
// import 'package:g7_comerce_app/core/theme/textstyle.dart';
// import 'package:g7_comerce_app/presentation/bloc/auth/auth_bloc.dart';
// import 'package:g7_comerce_app/presentation/bloc/auth/auth_state.dart';
// import 'package:g7_comerce_app/presentation/widgets/bottom_navigation.dart';
// import 'package:pinput/pinput.dart';

// class OtpScreen extends StatelessWidget {
//   const OtpScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocListener<LoginBloc, LoginState>(
//         listener: (context, state) {
//           // TODO: implement listener
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 70),
//               Center(child: Image.asset(AssetResources.logo, scale: 6)),
//               SizedBox(height: 20),
//               Center(
//                 child: Text(
//                   "Enter Your Otp Number",
//                   style: AppTextstyle.large(),
//                 ),
//               ),
//               SizedBox(height: 90),
//               Pinput(
//                 length: 6,
//                 keyboardType: TextInputType.number,
//                 onCompleted: (pin) {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (_) => BottomNavigationWidget()),
//                   );
//                 },
//                 defaultPinTheme: PinTheme(
//                   width: 55,
//                   height: 55,
//                   textStyle: AppTextstyle.large(),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: Colors.grey),
//                   ),
//                 ),
//                 focusedPinTheme: PinTheme(
//                   height: 60,
//                   width: 60,
//                   textStyle: AppTextstyle.large(),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     border: Border.all(color: Colors.black),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g7_comerce_app/core/theme/asset_resources.dart';
import 'package:g7_comerce_app/core/theme/textstyle.dart';
import 'package:g7_comerce_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:g7_comerce_app/presentation/bloc/auth/auth_event.dart';
import 'package:g7_comerce_app/presentation/bloc/auth/auth_state.dart';
import 'package:g7_comerce_app/presentation/widgets/bottom_navigation.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is OtpVerifyLoading) {
            // You can show a loading indicator
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          } else if (state is OtpVerifySuccess) {
            // Close loading dialog
            Navigator.of(context, rootNavigator: true).pop();

            // Navigate to Home or BottomNavigation
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const BottomNavigationWidget()),
            );
          } else if (state is OtpVerifyFailure) {
            // Close loading dialog if open
            Navigator.of(context, rootNavigator: true).pop();

            // Show error
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
              SizedBox(height: 70),
              Center(child: Image.asset(AssetResources.logo, scale: 6)),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Enter Your OTP Number",
                  style: AppTextstyle.large(),
                ),
              ),
              SizedBox(height: 90),
              Pinput(
                length: 6,
                keyboardType: TextInputType.number,
                onCompleted: (pin) {
                  // Call OTP verification
                  context.read<LoginBloc>().add(VerifyOtpEvent(pin));
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

