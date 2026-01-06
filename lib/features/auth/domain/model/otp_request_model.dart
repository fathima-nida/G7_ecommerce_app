import 'package:equatable/equatable.dart';

class OtpRequestModel extends Equatable {
final String otp;
 const OtpRequestModel({required this.otp});
 
  @override
 
  List<Object?> get props => [otp];
  Map<String,dynamic>toMap(){
    return {"Otpcode":otp};
  }

}