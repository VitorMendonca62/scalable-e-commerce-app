import 'package:scalable_e_commerce_app/core/errors/network_errors.dart';
import 'package:scalable_e_commerce_app/core/network/api_client.dart';
import 'package:scalable_e_commerce_app/core/network/endpoints.dart';
import 'package:scalable_e_commerce_app/modules/auth/infrastructure/dto/login_user_dto.dart';
import "package:dio/dio.dart";

class LoginRemoteDatasource {
  final APIClient apiClient;

  LoginRemoteDatasource(this.apiClient);

  Future<LoginResponseDTO> defaultLogin(LoginRequestDTO body) async {
    try {
      final response = await apiClient.post<Map<String, dynamic>>(
        Endpoints.login,
        data: body.toJson(),
      );
      return LoginResponseDTO.fromJson(response.data!);
    } on DioException catch (err) {
      throw _handleError(err);
    }
  }

  Future<LoginResponseDTO> googleLogin() async {
    try {
      final response = await apiClient.post<Map<String, dynamic>>(
        Endpoints.google,
      );

      return LoginResponseDTO.fromJson(response.data!);
    } on DioException catch (err) {
      throw _handleError(err);
    }
  }

  Exception _handleError(DioException err) {
    final statusCode = err.response?.statusCode;
    final data = err.response?.data;

    switch (statusCode) {
      case 400:
        return InvalidFieldException(
          field: data['data']['field'],
          message: data['message'],
        );
      case 401:
        return UnauthorizedException(message: data['message']);

      case 500:
        return ServerException(message: data['message']);

      default:
        return UnexpectedException();
    }
  }
}
