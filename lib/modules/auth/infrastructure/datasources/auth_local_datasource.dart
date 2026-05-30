import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:scalable_e_commerce_app/modules/auth/domain/entities/auth_tokens_entity.dart';

class AuthLocalDatasource {
  final FlutterSecureStorage storage;

  AuthLocalDatasource(this.storage);

  Future<void> saveTokens(AuthTokens tokens) async {
    await storage.write(key: 'access_token', value: tokens.accessToken);

    await storage.write(key: 'refresh_token', value: tokens.refreshToken);
  }

  Future<AuthTokens?> getTokens() async {
    final accessToken = await storage.read(key: 'access_token');

    final refreshToken = await storage.read(key: 'refresh_token');

    if (accessToken == null || refreshToken == null) {
      return null;
    }

    return AuthTokens(accessToken: accessToken, refreshToken: refreshToken);
  }

  Future<void> clearTokens() async {
    await storage.deleteAll();
  }
}
