import 'package:g7_comerce_app/domain/home/models/section_newarrival/sec_newarrivalpagination_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pagination_dto.g.dart';

@JsonSerializable()
class PaginationDto {
  final dynamic page;
  final dynamic pageSize;
  final dynamic totalRecords;
  final dynamic totalPages;

  const PaginationDto({
    this.page,
    this.pageSize,
    this.totalRecords,
    this.totalPages,
  });

  factory PaginationDto.fromJson(Map<String, dynamic> json) =>
      _$PaginationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationDtoToJson(this);

  PaginationModel toModel() {
    int _toInt(dynamic value) => int.tryParse(value?.toString() ?? "0") ?? 0;
    return PaginationModel(
      page: _toInt(page),
      pageSize: _toInt(pageSize),
      totalRecords: _toInt(totalRecords),
      totalPages: _toInt(totalPages),
    );
  }
}
