
import 'package:g7_comerce_app/domain/home/models/banner/banner_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'banner_item_dto.g.dart';

@JsonSerializable()
class BannerItemDto {
  final int? id;
  final List<String>? images;

  const BannerItemDto({
    this.id,
    this.images,
  });

  factory BannerItemDto.fromJson(Map<String, dynamic> json) =>
      _$BannerItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BannerItemDtoToJson(this);

  /// DTO → Domain
  BannerItemModel toModel() {
    return BannerItemModel(
      id: id ?? 0,
      images: images ?? const [],
    );
  }
}
