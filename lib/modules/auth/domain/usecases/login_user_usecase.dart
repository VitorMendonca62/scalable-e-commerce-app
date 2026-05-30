import 'package:fpdart/fpdart.dart';
import 'package:scalable_e_commerce_app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:scalable_e_commerce_app/modules/auth/errors/auth_failures.dart';

class LoginUserUsecase {
  final AuthRepository _repository;

  LoginUserUsecase(this._repository);

  Future<Either<AuthFailure, void>> executeDefault({
    required String email,
    required String password,
  }) async {
    return _repository.login(email, password);
  }

  Future<Either<AuthFailure, void>> executeGoogle() async {
    return _repository.loginWithGoogle();
  }
}
