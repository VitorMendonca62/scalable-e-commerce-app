import 'package:dio/dio.dart';
import 'package:scalable_e_commerce_app/core/network/interceptors/logger_interceptor.dart';

import 'endpoints.dart';

final class DioFactory {
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: Endpoints.baseUrl,

        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),

        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.addAll([LoggerInterceptor()]);

    return dio;
  }
}
