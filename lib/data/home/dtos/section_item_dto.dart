
import 'package:g7_comerce_app/domain/home/models/section_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'section_item_dto.g.dart';

@JsonSerializable()
class SectionItemDataDto {
  final dynamic id;
  final dynamic name;
  final dynamic mrp;
  @JsonKey(name: "is_in_wishlist")
  final dynamic isInWishlist;
  final List<dynamic>? images;

  const SectionItemDataDto({
    this.id,
    this.name,
    this.mrp,
    this.isInWishlist,
    this.images,
  });

  factory SectionItemDataDto.fromJson(Map<String, dynamic> json) =>
      _$SectionItemDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SectionItemDataDtoToJson(this);

  SectionItemDataModel toModel() {
    int _toInt(dynamic value) => int.tryParse(value?.toString() ?? "0") ?? 0;
    double _toDouble(dynamic value) => double.tryParse(value?.toString() ?? "0") ?? 0.0;
    bool _toBool(dynamic value) => _toInt(value) == 1;

    return SectionItemDataModel(
      id: _toInt(id),
      name: name?.toString() ?? '',
      mrp: _toDouble(mrp),
      isInWishlist: _toBool(isInWishlist),
      images: (images ?? []).map((e) => e.toString()).toList(),
    );
  }
}
