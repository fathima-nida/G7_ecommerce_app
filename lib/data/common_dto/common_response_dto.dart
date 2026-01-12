import 'package:g7_comerce_app/domain/common/common_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'common_response_dto.g.dart';

@JsonSerializable()
class CommonResponseDto {
  @JsonKey(name: "status")
  final bool? status;

  @JsonKey(name: "statusCode")
  final int? statusCode;

  @JsonKey(name: "message")
  final String? message;

  const CommonResponseDto({
    this.status,
    this.statusCode,
    this.message,
  });

  factory CommonResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CommonResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CommonResponseDtoToJson(this);

  /// ✅ DTO → Domain Model
  CommonResponseModel toModel() {
    return CommonResponseModel(
      status: status ?? false,
      statusCode: statusCode ?? 0,
      message: message ?? '',
    );
  }
}
