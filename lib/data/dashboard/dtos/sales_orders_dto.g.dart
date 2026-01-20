// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_orders_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesOrdersRespDto _$SalesOrdersRespDtoFromJson(Map<String, dynamic> json) =>
    SalesOrdersRespDto(
      totalRecords: json['totalRecords'],
      fromDate: json['fromDate'],
      toDate: json['toDate'],
      pageNumber: json['pageNumber'],
      pageSize: json['pageSize'],
      totalPages: json['totalPages'],
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SalesOrdersDataDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SalesOrdersRespDtoToJson(SalesOrdersRespDto instance) =>
    <String, dynamic>{
      'totalRecords': instance.totalRecords,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'totalPages': instance.totalPages,
      'data': instance.data,
    };

SalesOrdersDataDto _$SalesOrdersDataDtoFromJson(Map<String, dynamic> json) =>
    SalesOrdersDataDto(
      orderId: json['orderId'],
      orderNo: json['orderNo'],
      customerId: json['customerId'],
      customerName: json['customerName'],
      routeId: json['routeId'],
      routeName: json['routeName'],
      areaId: json['areaId'],
      areaName: json['areaName'],
      salesmanId: json['salesmanId'],
      salesmanName: json['salesmanName'],
      date: json['date'],
      status: json['status'],
      total: json['total'],
    );

Map<String, dynamic> _$SalesOrdersDataDtoToJson(SalesOrdersDataDto instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'orderNo': instance.orderNo,
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'routeId': instance.routeId,
      'routeName': instance.routeName,
      'areaId': instance.areaId,
      'areaName': instance.areaName,
      'salesmanId': instance.salesmanId,
      'salesmanName': instance.salesmanName,
      'date': instance.date,
      'status': instance.status,
      'total': instance.total,
    };
