// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpResponseDto _$OtpResponseDtoFromJson(Map<String, dynamic> json) =>
    OtpResponseDto(
      userId: json['userId'],
      mobileNo: json['mobileNo'],
      role: json['role'],
      ledgerId: json['ledgerId'],
      ledgerName: json['ledgerName'],
      profileImage: json['profileImage'],
      areas: json['areas'] as List<dynamic>?,
      routes: json['routes'] as List<dynamic>?,
    );

Map<String, dynamic> _$OtpResponseDtoToJson(OtpResponseDto instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'mobileNo': instance.mobileNo,
      'role': instance.role,
      'ledgerId': instance.ledgerId,
      'ledgerName': instance.ledgerName,
      'profileImage': instance.profileImage,
      'areas': instance.areas,
      'routes': instance.routes,
    };
