import 'dart:convert';

class ApiResponseDto<T> {
  final bool status;
  final int statusCode;
  final String message;
  final T? data;

  const ApiResponseDto({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ApiResponseDto.fromJson(
    dynamic json, {
    required T Function(dynamic json) dataParser,
  }) {
    late final Map<String, dynamic> raw;

    if (json is Map<String, dynamic>) {
      raw = json;
    } else if (json is String) {
      raw = jsonDecode(json) as Map<String, dynamic>;
    } else {
      throw Exception(
        "ApiResponseDto: Expected Map<String,dynamic> but got ${json.runtimeType}",
      );
    }

    return ApiResponseDto(
      status: raw["status"] as bool? ?? false,
      statusCode: (raw["statusCode"] as num?)?.toInt() ?? 0,
      message: raw["message"] as String? ?? "",
      data: dataParser(raw["data"]),
    );
  }
}
