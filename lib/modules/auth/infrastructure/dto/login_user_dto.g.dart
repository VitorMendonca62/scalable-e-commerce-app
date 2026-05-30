// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestDTO _$LoginRequestDTOFromJson(Map<String, dynamic> json) =>
    LoginRequestDTO(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginRequestDTOToJson(LoginRequestDTO instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

LoginResponseSuccessData _$LoginResponseSuccessDataFromJson(
  Map<String, dynamic> json,
) => LoginResponseSuccessData(
  refreshToken: json['refresh_token'] as String,
  accessToken: json['access_token'] as String,
);

Map<String, dynamic> _$LoginResponseSuccessDataToJson(
  LoginResponseSuccessData instance,
) => <String, dynamic>{
  'refresh_token': instance.refreshToken,
  'access_token': instance.accessToken,
};

LoginResponseDTO<T> _$LoginResponseDTOFromJson<T>(Map<String, dynamic> json) =>
    LoginResponseDTO<T>(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : LoginResponseSuccessData.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$LoginResponseDTOToJson<T>(
  LoginResponseDTO<T> instance,
) => <String, dynamic>{
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
};
