import 'package:json_annotation/json_annotation.dart';
import 'package:g7_comerce_app/domain/dashboard/models/sales_orders_resp_model.dart';

part 'sales_orders_dto.g.dart';

@JsonSerializable()
class SalesOrdersRespDto {
  @JsonKey(name: "totalRecords")
  final dynamic totalRecords;

  @JsonKey(name: "fromDate")
  final dynamic fromDate;

  @JsonKey(name: "toDate")
  final dynamic toDate;

  @JsonKey(name: "pageNumber")
  final dynamic pageNumber;

  @JsonKey(name: "pageSize")
  final dynamic pageSize;

  @JsonKey(name: "totalPages")
  final dynamic totalPages;

  @JsonKey(name: "data")
  final List<SalesOrdersDataDto>? data;

  const SalesOrdersRespDto({
    this.totalRecords,
    this.fromDate,
    this.toDate,
    this.pageNumber,
    this.pageSize,
    this.totalPages,
    this.data,
  });

  factory SalesOrdersRespDto.fromJson(Map<String, dynamic> json) =>
      _$SalesOrdersRespDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SalesOrdersRespDtoToJson(this);

  /// ✅ DTO -> Model
  SalesOrdersRespModel toModel() {
    return SalesOrdersRespModel(
      totalRecords: int.tryParse(totalRecords?.toString() ?? "0") ?? 0,
      fromDate: fromDate != null
          ? DateTime.tryParse(fromDate.toString()) ?? DateTime.now()
          : DateTime.now(),
      toDate: toDate != null
          ? DateTime.tryParse(toDate.toString()) ?? DateTime.now()
          : DateTime.now(),
      pageNumber: int.tryParse(pageNumber?.toString() ?? "1") ?? 1,
      pageSize: int.tryParse(pageSize?.toString() ?? "10") ?? 10,
      totalPages: int.tryParse(totalPages?.toString() ?? "1") ?? 1,
      data: (data ?? []).map((e) => e.toModel()).toList(),
    );
  }
}

@JsonSerializable()
class SalesOrdersDataDto {
  @JsonKey(name: "orderId")
  final dynamic orderId;

  @JsonKey(name: "orderNo")
  final dynamic orderNo;

  @JsonKey(name: "customerId")
  final dynamic customerId;

  @JsonKey(name: "customerName")
  final dynamic customerName;

  @JsonKey(name: "routeId")
  final dynamic routeId;

  @JsonKey(name: "routeName")
  final dynamic routeName;

  @JsonKey(name: "areaId")
  final dynamic areaId;

  @JsonKey(name: "areaName")
  final dynamic areaName;

  @JsonKey(name: "salesmanId")
  final dynamic salesmanId;

  @JsonKey(name: "salesmanName")
  final dynamic salesmanName;

  @JsonKey(name: "date")
  final dynamic date;

  @JsonKey(name: "status")
  final dynamic status;

  @JsonKey(name: "total")
  final dynamic total;

  const SalesOrdersDataDto({
    this.orderId,
    this.orderNo,
    this.customerId,
    this.customerName,
    this.routeId,
    this.routeName,
    this.areaId,
    this.areaName,
    this.salesmanId,
    this.salesmanName,
    this.date,
    this.status,
    this.total,
  });

  factory SalesOrdersDataDto.fromJson(Map<String, dynamic> json) =>
      _$SalesOrdersDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SalesOrdersDataDtoToJson(this);

  /// ✅ DTO -> Model
  DataModel toModel() {
    return DataModel(
      orderId: int.tryParse(orderId?.toString() ?? "0") ?? 0,
      orderNo: int.tryParse(orderNo?.toString() ?? "0") ?? 0,
      customerId: int.tryParse(customerId?.toString() ?? "0") ?? 0,
      customerName: customerName?.toString() ?? '',
      routeId: int.tryParse(routeId?.toString() ?? "0") ?? 0,
      routeName: routeName?.toString() ?? '',
      areaId: int.tryParse(areaId?.toString() ?? "0") ?? 0,
      areaName: areaName?.toString() ?? '',
      salesmanId: int.tryParse(salesmanId?.toString() ?? "0") ?? 0,
      salesmanName: salesmanName?.toString() ?? '',
      date: date != null
          ? DateTime.tryParse(date.toString()) ?? DateTime.now()
          : DateTime.now(),
      status: status?.toString() ?? '',
      total: double.tryParse(total?.toString() ?? "0") ?? 0.0, 
    );
  }
}
