import 'package:equatable/equatable.dart';
import 'package:g7_comerce_app/domain/common/common_response_model.dart';
import 'banner_data_model.dart';

class BannerResponseModel extends Equatable {
  final CommonResponseModel common;
  final BannerDataModel data;

  const BannerResponseModel({
    required this.common,
    required this.data,
  });

  factory BannerResponseModel.fromMap(Map<String, dynamic> map) {
    return BannerResponseModel(
      common: CommonResponseModel.fromMap(map),
      data: BannerDataModel.fromMap(map['data'] ?? {}),
    );
  }

  @override
  List<Object?> get props => [common, data];
}
