import 'package:g7_comerce_app/domain/home/models/section_newarrival/sec_newarrivalpagination_model.dart';
import 'package:g7_comerce_app/domain/home/models/section_newarrival/section_newarrival_resp_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'pagination_dto.dart';
import 'section_item_dto.dart';

part 'sec_newarrival_resp_dto.g.dart';

@JsonSerializable(explicitToJson: true) // important for nested DTOs
class SecNewArrivalRespDto {
  final PaginationDto? pagination;
  final List<SectionItemDataDto>? sections;

  const SecNewArrivalRespDto({
    this.pagination,
    this.sections,
  });

  factory SecNewArrivalRespDto.fromJson(Map<String, dynamic> json) =>
      _$SecNewArrivalRespDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SecNewArrivalRespDtoToJson(this);

  SectionWiseItemsRespModel toModel() {
    return SectionWiseItemsRespModel(
      pagination: pagination?.toModel() ?? PaginationModel.dummy(),
      sections: (sections ?? []).map((e) => e.toModel()).toList(),
    );
  }
}
