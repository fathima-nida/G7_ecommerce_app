import 'package:equatable/equatable.dart';

class CstmrDashboardRespModel extends Equatable {
  final int allProducts;
  final String fromDate;
  final String toDate;
  final List<ProductStatusDataModel> data;

  const CstmrDashboardRespModel({
    required this.allProducts,
    required this.fromDate,
    required this.toDate,
    required this.data,
  });

  factory CstmrDashboardRespModel.fromMap(Map<String, dynamic> map) {
    return CstmrDashboardRespModel(
      allProducts: map['allProducts'] ?? 0,
      fromDate: map['fromDate'] ?? '',
      toDate: map['toDate'] ?? '',
      data: List<ProductStatusDataModel>.from(
        (map['data'] ?? []).map(
          (x) => ProductStatusDataModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory CstmrDashboardRespModel.dummy() {
    return const CstmrDashboardRespModel(
      allProducts: 0,
      fromDate: '',
      toDate: '',
      data: [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'allProducts': allProducts,
      'fromDate': fromDate,
      'toDate': toDate,
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  CstmrDashboardRespModel copyWith({
    int? allProducts,
    String? fromDate,
    String? toDate,
    List<ProductStatusDataModel>? data,
  }) {
    return CstmrDashboardRespModel(
      allProducts: allProducts ?? this.allProducts,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [allProducts, fromDate, toDate, data];
}

class ProductStatusDataModel extends Equatable {
  final String status;
  final int totalCount;

  const ProductStatusDataModel({
    required this.status,
    required this.totalCount,
  });

  factory ProductStatusDataModel.fromMap(Map<String, dynamic> map) {
    return ProductStatusDataModel(
      status: map['status'] ?? '',
      totalCount: map['totalCount'] ?? 0,
    );
  }

  factory ProductStatusDataModel.dummy() {
    return const ProductStatusDataModel(status: '', totalCount: 0);
  }

  Map<String, dynamic> toMap() {
    return {'status': status, 'totalCount': totalCount};
  }

  ProductStatusDataModel copyWith({String? status, int? totalCount}) {
    return ProductStatusDataModel(
      status: status ?? this.status,
      totalCount: totalCount ?? this.totalCount,
    );
  }

  @override
  List<Object?> get props => [status, totalCount];
}
