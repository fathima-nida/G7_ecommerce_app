import 'package:equatable/equatable.dart';

class SalesOrdersRespModel extends Equatable {
  final int totalRecords;
  final DateTime fromDate;
  final DateTime toDate;
  final int pageNumber;
  final int pageSize;
  final int totalPages;
  final List<DataModel> data;

  const SalesOrdersRespModel({
    required this.totalRecords,
    required this.fromDate,
    required this.toDate,
    required this.pageNumber,
    required this.pageSize,
    required this.totalPages,
    required this.data,
  });

  @override
  List<Object?> get props => [
        totalRecords,
        fromDate,
        toDate,
        pageNumber,
        pageSize,
        totalPages,
        data,
      ];

  factory SalesOrdersRespModel.fromMap(Map<String, dynamic> map) {
    return SalesOrdersRespModel(
      totalRecords: int.tryParse(map['totalRecords']?.toString() ?? "0") ?? 0,
      fromDate: DateTime.tryParse(map['fromDate']?.toString() ?? '') ??
          DateTime.now(),
      toDate:
          DateTime.tryParse(map['toDate']?.toString() ?? '') ?? DateTime.now(),
      pageNumber: int.tryParse(map['pageNumber']?.toString() ?? "1") ?? 1,
      pageSize: int.tryParse(map['pageSize']?.toString() ?? "10") ?? 10,
      totalPages: int.tryParse(map['totalPages']?.toString() ?? "1") ?? 1,
      data: (map['data'] as List? ?? [])
          .map((e) => DataModel.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class DataModel extends Equatable {
  final int orderId;
  final int orderNo;
  final int customerId;
  final String customerName;
  final int routeId;
  final String routeName;
  final int areaId;
  final String areaName;
  final int salesmanId;
  final String salesmanName;
  final DateTime date;
  final String status;
  final double total; 

  const DataModel({
    required this.orderId,
    required this.orderNo,
    required this.customerId,
    required this.customerName,
    required this.routeId,
    required this.routeName,
    required this.areaId,
    required this.areaName,
    required this.salesmanId,
    required this.salesmanName,
    required this.date,
    required this.status,
    required this.total,
  });

  @override
  List<Object?> get props => [
        orderId,
        orderNo,
        customerId,
        customerName,
        routeId,
        routeName,
        areaId,
        areaName,
        salesmanId,
        salesmanName,
        date,
        status,
        total,
      ];

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      orderId: int.tryParse(map['orderId']?.toString() ?? "0") ?? 0,
      orderNo: int.tryParse(map['orderNo']?.toString() ?? "0") ?? 0,
      customerId: int.tryParse(map['customerId']?.toString() ?? "0") ?? 0,
      customerName: map['customerName']?.toString() ?? '',
      routeId: int.tryParse(map['routeId']?.toString() ?? "0") ?? 0,
      routeName: map['routeName']?.toString() ?? '',
      areaId: int.tryParse(map['areaId']?.toString() ?? "0") ?? 0,
      areaName: map['areaName']?.toString() ?? '',
      salesmanId: int.tryParse(map['salesmanId']?.toString() ?? "0") ?? 0,
      salesmanName: map['salesmanName']?.toString() ?? '',
      date: DateTime.tryParse(map['date']?.toString() ?? '') ?? DateTime.now(),
      status: map['status']?.toString() ?? '',
      total: double.tryParse(map['total']?.toString() ?? "0") ?? 0.0,
    );
  }
}
