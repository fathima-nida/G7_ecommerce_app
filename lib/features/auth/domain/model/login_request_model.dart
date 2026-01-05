import 'package:equatable/equatable.dart';
class LoginRequestModel extends Equatable {
  final String mobile;
 const LoginRequestModel({required this.mobile});
@override
  List<Object?> get props => [mobile];

  Map<String, dynamic> toMap() {
    return {"MobileNo": mobile,};
  }
}
