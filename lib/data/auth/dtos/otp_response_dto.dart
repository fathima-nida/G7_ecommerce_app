import 'package:g7_comerce_app/domain/auth/models/otp_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'otp_response_dto.g.dart';

@JsonSerializable()
class OtpResponseDto {
  @JsonKey(name: "userId")
  final dynamic userId;

  @JsonKey(name: "mobileNo")
  final dynamic mobileNo;

  @JsonKey(name: "role")
  final dynamic role;

  @JsonKey(name: "ledgerId")
  final dynamic ledgerId;

  @JsonKey(name: "ledgerName")
  final dynamic ledgerName;

  @JsonKey(name: "profileImage")
  final dynamic profileImage;

  @JsonKey(name: "areas")
  final List<dynamic>? areas;

  @JsonKey(name: "routes")
  final List<dynamic>? routes;

  const OtpResponseDto({
    this.userId,
    this.mobileNo,
    this.role,
    this.ledgerId,
    this.ledgerName,
    this.profileImage,
    this.areas,
    this.routes,
  });

  factory OtpResponseDto.fromJson(Map<String, dynamic> json) =>
      _$OtpResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OtpResponseDtoToJson(this);

  /// ✅ DTO → Domain Model
  OtpResponseModel toModel() {
    return OtpResponseModel(
      userId: userId ?? 0,
      mobileNo: mobileNo?.toString() ?? '',
      role: role?.toString() ?? '',
      ledgerId: ledgerId ?? 0,
      ledgerName: ledgerName?.toString() ?? '',
      profileImage: profileImage?.toString() ?? '',
      areas: areas ?? const [],
      routes: routes ?? const [],
    );
  }
}
