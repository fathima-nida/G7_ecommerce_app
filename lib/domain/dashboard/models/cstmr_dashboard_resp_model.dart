import 'package:equatable/equatable.dart';
import 'package:g7_comerce_app/domain/common/common_response_model.dart';

class CstmrDashboardRespModel extends CommonResponseModel {
  final int allProducts;
  final String fromDate;
  final String toDate;
  final List<DashboardStatusModel> data;

  const CstmrDashboardRespModel ({
    required super.status,
    required super.statusCode,
    required super.message,
    required this.allProducts,
    required this.fromDate,
    required this.toDate,
    required this.data,
  });

  factory CstmrDashboardRespModel.fromMap(Map<String, dynamic> map) {
    return CstmrDashboardRespModel(
      status: map['status'] ?? false,
      statusCode: map['statusCode'] ?? 0,
      message: map['message'] ?? '',
      allProducts: map['allProducts'] ?? 0,
      fromDate: map['fromDate'] ?? '',
      toDate: map['toDate'] ?? '',
      data: (map['data'] as List<dynamic>?)
              ?.map((e) => DashboardStatusModel.fromMap(e))
              .toList() ??
          [],
    );
  }

  factory CstmrDashboardRespModel.dummy() {
    return const CstmrDashboardRespModel(
      status: false,
      statusCode: 0,
      message: '',
      allProducts: 0,
      fromDate: '',
      toDate: '',
      data: [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      ...super.toMap(),
      'allProducts': allProducts,
      'fromDate': fromDate,
      'toDate': toDate,
      'data': data.map((e) => e.toMap()).toList(),
    };
  }

  @override
  List<Object?> get props =>
      super.props + [allProducts, fromDate, toDate, data];

  CstmrDashboardRespModel copyWith({
    bool? status,
    int? statusCode,
    String? message,
    int? allProducts,
    String? fromDate,
    String? toDate,
    List<DashboardStatusModel>? data,
  }) {
    return CstmrDashboardRespModel(
      status: status ?? this.status,
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      allProducts: allProducts ?? this.allProducts,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      data: data ?? this.data,
    );
  }
}


class DashboardStatusModel extends Equatable {
  final String status;
  final int totalCount;

  const DashboardStatusModel({
    required this.status,
    required this.totalCount,
  });

  factory DashboardStatusModel.fromMap(Map<String, dynamic> map) {
    return DashboardStatusModel(
      status: map['status'] ?? '',
      totalCount: map['totalCount'] ?? 0,
    );
  }

  factory DashboardStatusModel.dummy() {
    return const DashboardStatusModel(
      status: '',
      totalCount: 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'totalCount': totalCount,
    };
  }

  @override
  List<Object?> get props => [status, totalCount];

  DashboardStatusModel copyWith({
    String? status,
    int? totalCount,
  }) {
    return DashboardStatusModel(
      status: status ?? this.status,
      totalCount: totalCount ?? this.totalCount,
    );
  }
}
