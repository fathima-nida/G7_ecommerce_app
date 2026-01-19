import 'package:g7_comerce_app/domain/home/models/banner/banner_data_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'banner_item_dto.dart';

part 'banner_data_dto.g.dart';

@JsonSerializable()
class BannerDataDto {
  final List<BannerItemDto>? banner1;
  final List<BannerItemDto>? banner2;

  const BannerDataDto({
    this.banner1,
    this.banner2,
  });

  factory BannerDataDto.fromJson(Map<String, dynamic> json) =>
      _$BannerDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BannerDataDtoToJson(this);

  /// DTO → Domain
  BannerDataModel toModel() {
    return BannerDataModel(
      banner1: banner1?.map((e) => e.toModel()).toList() ?? [],
      banner2: banner2?.map((e) => e.toModel()).toList() ?? [],
    );
  }
}
