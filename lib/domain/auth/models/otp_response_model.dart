import 'package:equatable/equatable.dart';

class OtpResponseModel extends Equatable {
  final int userId;
  final String mobileNo;
  final String role;
  final int ledgerId;
  final String ledgerName;
  final String profileImage;
  final List<dynamic> areas;
  final List<dynamic> routes;

  const OtpResponseModel({
    
    required this.userId,
    required this.mobileNo,
    required this.role,
    required this.ledgerId,
    required this.ledgerName,
    required this.profileImage,
    required this.areas,
    required this.routes,
  });

  factory OtpResponseModel.fromMap(Map<String, dynamic> map) {
    final data = map['data'] ?? {};

    return OtpResponseModel(
    

      userId: data['userId'] ?? 0,
      mobileNo: data['mobileNo'] ?? '',
      role: data['role'] ?? '',
      ledgerId: data['ledgerId'] ?? 0,
      ledgerName: data['ledgerName'] ?? '',
      profileImage: data['profileImage'] ?? '',
      areas: List<dynamic>.from(data['areas'] ?? []),
      routes: List<dynamic>.from(data['routes'] ?? []),
    );
  }

  factory OtpResponseModel.dummy() {
    return const OtpResponseModel(
   
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

  @override
  Map<String, dynamic> toMap() {
    return {
  
      'data': {
        'userId': userId,
        'mobileNo': mobileNo,
        'role': role,
        'ledgerId': ledgerId,
        'ledgerName': ledgerName,
        'profileImage': profileImage,
        'areas': areas,
        'routes': routes,
      },
    };
  }

  @override
  List<Object?> get props =>
 
      [
        userId,
        mobileNo,
        role,
        ledgerId,
        ledgerName,
        profileImage,
        areas,
        routes,
      ];

  OtpResponseModel copyWith({
 
    int? userId,
    String? mobileNo,
    String? role,
    int? ledgerId,
    String? ledgerName,
    String? profileImage,
    List<dynamic>? areas,
    List<dynamic>? routes,
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
 
}

