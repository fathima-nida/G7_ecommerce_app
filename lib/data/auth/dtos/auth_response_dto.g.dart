// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseDto _$LoginResponseDtoFromJson(Map<String, dynamic> json) =>
    LoginResponseDto(
      token: json['token'],
      expiration: json['expiration'],
      otpCode: json['otpCode'],
    );

Map<String, dynamic> _$LoginResponseDtoToJson(LoginResponseDto instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expiration': instance.expiration,
      'otpCode': instance.otpCode,
    };
