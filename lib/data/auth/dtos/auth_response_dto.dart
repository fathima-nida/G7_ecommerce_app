import 'package:g7_comerce_app/domain/auth/models/login_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_response_dto.g.dart';

@JsonSerializable()
class LoginResponseDto {
  /// Common response fields
  // @JsonKey(name: "status")
  // final bool? status;

  // @JsonKey(name: "statusCode")
  // final int? statusCode;

  // @JsonKey(name: "message")
  // final String? message;

  /// Login-specific fields
  @JsonKey(name: "token")
  final dynamic token;

  @JsonKey(name: "expiration")
  final dynamic expiration;

  @JsonKey(name: "otpCode")
  final dynamic otpCode;

  const LoginResponseDto({
    // this.status,
    // this.statusCode,
    // this.message,
    this.token,
    this.expiration,
    this.otpCode,
  });

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseDtoToJson(this);

  /// ✅ Convert DTO → Domain Model
  LoginResponseModel toModel() {
    return LoginResponseModel(
      // status: status ?? false,
      // statusCode: statusCode ?? 0,
      // message: message ?? '',
      token: token?.toString() ?? '',
      expiration: expiration?.toString() ?? '',
      otpCode: otpCode?.toString() ?? '',
    );
  }
}
