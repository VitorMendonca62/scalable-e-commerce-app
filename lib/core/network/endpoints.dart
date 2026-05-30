import 'dart:io';

abstract final class Endpoints {
  // Base URL
  static String get baseUrl => Platform.isAndroid
      ? 'https://opinionated-digestibly-jordon.ngrok-free.dev'
      : 'http://localhost:8086';

  // Auth
  static const login = '/auth/login';
  static const google = '/auth/google';
  static const register = '/auth/register';
  static const refreshToken = '/auth/refresh-token';
  static const forgotPassword = '/auth/forgot-password';
}
