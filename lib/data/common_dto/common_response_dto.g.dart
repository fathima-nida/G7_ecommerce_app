// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonResponseDto _$CommonResponseDtoFromJson(Map<String, dynamic> json) =>
    CommonResponseDto(
      status: json['status'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CommonResponseDtoToJson(CommonResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };
