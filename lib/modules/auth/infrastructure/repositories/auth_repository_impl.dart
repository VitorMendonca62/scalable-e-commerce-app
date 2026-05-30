import 'package:fpdart/fpdart.dart';
import 'package:scalable_e_commerce_app/core/errors/network_errors.dart';
import 'package:scalable_e_commerce_app/modules/auth/domain/entities/auth_tokens_entity.dart';
import 'package:scalable_e_commerce_app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:scalable_e_commerce_app/modules/auth/errors/auth_failures.dart';
import 'package:scalable_e_commerce_app/modules/auth/infrastructure/datasources/auth_local_datasource.dart';
import 'package:scalable_e_commerce_app/modules/auth/infrastructure/datasources/login_remote_datasource.dart';
import 'package:scalable_e_commerce_app/modules/auth/infrastructure/dto/login_user_dto.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LoginRemoteDatasource remoteDatasource;
  final AuthLocalDatasource localDatasource;

  AuthRepositoryImpl(this.remoteDatasource, this.localDatasource);

  @override
  Future<Either<AuthFailure, void>> login(String email, String password) async {
    try {
      final response = await remoteDatasource.defaultLogin(
        LoginRequestDTO(email: email, password: password),
      );

      final dto = response.data!;

      final entity = AuthTokens(
        accessToken: dto.accessToken,
        refreshToken: dto.refreshToken,
      );

      localDatasource.saveTokens(entity);

      return Right(null);
    } on InvalidFieldException catch (e) {
      return Left(InvalidFieldFailure(field: e.field, message: e.message));
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(message: e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: 'Erro inesperado'));
    }
  }

  @override
  Future<Either<AuthFailure, void>> loginWithGoogle() async {
    try {
      final response = await remoteDatasource.googleLogin();

      final dto = response.data!;

      final entity = AuthTokens(
        accessToken: dto.accessToken,
        refreshToken: dto.refreshToken,
      );

      localDatasource.saveTokens(entity);

      return Right(null);
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(message: e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (_) {
      return Left(UnexpectedFailure(message: 'Erro inesperado'));
    }
  }
}
