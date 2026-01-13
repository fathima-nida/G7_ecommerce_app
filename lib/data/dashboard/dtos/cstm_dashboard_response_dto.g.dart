// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cstm_dashboard_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CstmrDashboardRespDto _$CstmrDashboardRespDtoFromJson(
  Map<String, dynamic> json,
) => CstmrDashboardRespDto(
  allProducts: json['allProducts'],
  fromDate: json['fromDate'],
  toDate: json['toDate'],
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => ProductStatusDataDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CstmrDashboardRespDtoToJson(
  CstmrDashboardRespDto instance,
) => <String, dynamic>{
  'allProducts': instance.allProducts,
  'fromDate': instance.fromDate,
  'toDate': instance.toDate,
  'data': instance.data,
};

ProductStatusDataDto _$ProductStatusDataDtoFromJson(
  Map<String, dynamic> json,
) => ProductStatusDataDto(
  status: json['status'],
  totalCount: json['totalCount'],
);

Map<String, dynamic> _$ProductStatusDataDtoToJson(
  ProductStatusDataDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'totalCount': instance.totalCount,
};
