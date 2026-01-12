import 'package:g7_comerce_app/domain/common/common_response_model.dart';

class OtpResponseModel extends CommonResponseModel {
  final int userId;
  final String mobileNo;
  final String role;
  final int ledgerId;
  final String ledgerName;
  final String profileImage;
  final List<dynamic> areas;
  final List<dynamic> routes;

  const OtpResponseModel({
    required super.status,
    required super.statusCode,
    required super.message,
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
      status: map['status'] ?? false,
      statusCode: map['statusCode'] ?? 0,
      message: map['message'] ?? '',

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
      status: false,
      statusCode: 0,
      message: '',
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
      ...super.toMap(),
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
      super.props +
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
    bool? status,
    int? statusCode,
    String? message,
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
      status: status ?? this.status,
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
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
