import 'package:json_annotation/json_annotation.dart';

part 'login_user_dto.g.dart';

@JsonSerializable()
class LoginRequestDTO {
  final String email;
  final String password;

  LoginRequestDTO({required this.email, required this.password});

  factory LoginRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestDTOFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestDTOToJson(this);
}

@JsonSerializable()
class LoginResponseSuccessData {
  @JsonKey(name: "refresh_token")
  final String refreshToken;
  @JsonKey(name: "access_token")
  final String accessToken;

  LoginResponseSuccessData({
    required this.refreshToken,
    required this.accessToken,
  });

  factory LoginResponseSuccessData.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseSuccessDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseSuccessDataToJson(this);
}

@JsonSerializable()
class LoginResponseDTO<T> {
  final int statusCode;
  final String message;
  final LoginResponseSuccessData? data;

  LoginResponseDTO({
    required this.statusCode,
    required this.message,
    this.data,
  });

  factory LoginResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseDTOToJson(this);
}
