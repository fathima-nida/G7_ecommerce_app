import 'package:equatable/equatable.dart';

class OtpResponseModel extends Equatable {
  final int userId;
  final String mobileNo;
  final String role;
  final int ledgerId;
  final String ledgerName;
  final String profileImage;
  final List areas;
  final List routes;

  OtpResponseModel({
    
  required this.userId,
  required this.mobileNo,
  required this.role,
  required this.ledgerId,
  required this.ledgerName,
  required this.profileImage,
  required this.areas,
  required this.routes});
  
factory OtpResponseModel.fromMap(Map<String, dynamic> map) {
    return OtpResponseModel(
      userId: map['userId'] ?? 0,
      mobileNo: map['mobileNo'] ?? '',
      role: map['role'] ?? '',
      ledgerId: map['ledgerId'] ?? 0,
      ledgerName: map['ledgerName'] ?? '',
      profileImage: map['profileImage'] ?? '',
      areas: map['areas'] ?? [],
      routes: map['routes'] ?? [],
    );
  }
    factory OtpResponseModel.dummy() {
    return  OtpResponseModel(
      userId: 0,
      mobileNo: '',
      role: '',
      ledgerId: 0,
      ledgerName: '',
      profileImage: '',
      areas: [],
      routes: [],
    );
  }

  
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'mobileNo': mobileNo,
      'role': role,
      'ledgerId': ledgerId,
      'ledgerName': ledgerName,
      'profileImage': profileImage,
      'areas': areas,
      'routes': routes,
    };
  }
    OtpResponseModel copyWith({
    int? userId,
    String? mobileNo,
    String? role,
    int? ledgerId,
    String? ledgerName,
    String? profileImage,
    List? areas,
    List? routes,
  }) {
    return OtpResponseModel(
      userId: userId ?? this.userId,
      mobileNo: mobileNo ?? this.mobileNo,
      role: role ?? this.role,
      ledgerId: ledgerId ?? this.ledgerId,
      ledgerName: ledgerName ?? this.ledgerName,
      profileImage: profileImage ?? this.profileImage,
      areas: areas ?? this.areas,
      routes: routes ?? this.routes,
    );
  }

  @override
  List<Object?> get props => [
        userId,
        mobileNo,
        role,
        ledgerId,
        ledgerName,
        profileImage,
        areas,
        routes,
      ];
  

}