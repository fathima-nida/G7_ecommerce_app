import 'package:g7_comerce_app/domain/home/models/banner/banner_data_model.dart';
import 'package:g7_comerce_app/domain/home/models/banner/banner_responsemodel.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:g7_comerce_app/domain/common/common_response_model.dart';
import 'banner_data_dto.dart';

part 'banner_resp_dto.g.dart';

@JsonSerializable()
class BannerResponseDto {
  final bool? status;
  final int? statusCode;
  final String? message;
  final BannerDataDto? data;

  const BannerResponseDto({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  factory BannerResponseDto.fromJson(Map<String, dynamic> json) =>
      _$BannerResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BannerResponseDtoToJson(this);

  /// DTO → Domain
  BannerResponseModel toModel() {
    return BannerResponseModel(
      common: CommonResponseModel(
        status: status ?? false,
        statusCode: statusCode ?? 0,
        message: message ?? '',
      ),
      data: data?.toModel() ?? const BannerDataModel(banner1: [], banner2: []),
    );
  }
}
