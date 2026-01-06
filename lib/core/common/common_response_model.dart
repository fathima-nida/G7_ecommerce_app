import 'package:equatable/equatable.dart';

class CommonResponseModel extends Equatable{
  final bool status;
  final int statusCode;
  final String message;
  const CommonResponseModel({required this.status, required this.statusCode, required this.message});

  @override
  List<Object?> get props => [status, statusCode, message];

factory CommonResponseModel.dummy(){
  return CommonResponseModel(status: true, statusCode: 0, message: " ");

}
  

}