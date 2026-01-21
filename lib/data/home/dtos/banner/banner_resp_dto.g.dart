// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_resp_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerResponseDto _$BannerResponseDtoFromJson(Map<String, dynamic> json) =>
    BannerResponseDto(
      status: json['status'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : BannerDataDto.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BannerResponseDtoToJson(BannerResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
