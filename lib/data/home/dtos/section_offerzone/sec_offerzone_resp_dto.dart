import 'package:json_annotation/json_annotation.dart';
import 'package:g7_comerce_app/data/home/dtos/section_newarrival/pagination_dto.dart';
import 'package:g7_comerce_app/data/home/dtos/section_newarrival/section_item_dto.dart';
import 'package:g7_comerce_app/domain/home/models/section_newarrival/sec_newarrivalpagination_model.dart';
import 'package:g7_comerce_app/domain/home/models/section_offerzone/sec_offerzone_resp_model.dart';

part 'sec_offerzone_resp_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class SectionOfferzoneRespDto {
  final PaginationDto? pagination;
  final List<SectionItemDataDto>? sections;

  const SectionOfferzoneRespDto({
    this.pagination,
    this.sections,
  });

  factory SectionOfferzoneRespDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$SectionOfferzoneRespDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SectionOfferzoneRespDtoToJson(this);

  SectionOfferzoneItemsRespModel toModel() {
    return SectionOfferzoneItemsRespModel(
      pagination: pagination?.toModel() ?? PaginationModel.dummy(),
      sections: (sections ?? []).map((e) => e.toModel()).toList(),
    );
  }
}
