import 'package:json_annotation/json_annotation.dart';
import 'package:g7_comerce_app/domain/dashboard/models/cstmr_dashboard_resp_model.dart';

part 'cstm_dashboard_response_dto.g.dart';  // ✅ must match file name

@JsonSerializable()
class CstmrDashboardRespDto {
  @JsonKey(name: "allProducts")
  final dynamic allProducts;

  @JsonKey(name: "fromDate")
  final dynamic fromDate;

  @JsonKey(name: "toDate")
  final dynamic toDate;

  @JsonKey(name: "data")
  final List<ProductStatusDataDto>? data;

  const CstmrDashboardRespDto({
    this.allProducts,
    this.fromDate,
    this.toDate,
    this.data,
  });

  factory CstmrDashboardRespDto.fromJson(Map<String, dynamic> json) =>
      _$CstmrDashboardRespDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CstmrDashboardRespDtoToJson(this);

  CstmrDashboardRespModel toModel() {
    return CstmrDashboardRespModel(
      allProducts: int.tryParse(allProducts?.toString() ?? "0") ?? 0,
      fromDate: fromDate?.toString() ?? '',
      toDate: toDate?.toString() ?? '',
      data: (data ?? []).map((e) => e.toModel()).toList(),
    );
  }
}

@JsonSerializable()
class ProductStatusDataDto {
  @JsonKey(name: "status")
  final dynamic status;

  @JsonKey(name: "totalCount")
  final dynamic totalCount;

  const ProductStatusDataDto({
    this.status,
    this.totalCount,
  });

  factory ProductStatusDataDto.fromJson(Map<String, dynamic> json) =>
      _$ProductStatusDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductStatusDataDtoToJson(this);

  ProductStatusDataModel toModel() {
    return ProductStatusDataModel(
      status: status?.toString() ?? '',
      totalCount: int.tryParse(totalCount?.toString() ?? "0") ?? 0,
    );
  }
}
