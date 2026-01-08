// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseDto _$LoginResponseDtoFromJson(Map<String, dynamic> json) =>
    LoginResponseDto(
      status: json['status'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      token: json['token'],
      expiration: json['expiration'],
      otpCode: json['otpCode'],
    );

Map<String, dynamic> _$LoginResponseDtoToJson(LoginResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'token': instance.token,
      'expiration': instance.expiration,
      'otpCode': instance.otpCode,
    };
