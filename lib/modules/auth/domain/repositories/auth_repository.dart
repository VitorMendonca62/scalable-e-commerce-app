import 'package:fpdart/fpdart.dart';
import 'package:scalable_e_commerce_app/modules/auth/errors/auth_failures.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, void>> login(String email, String password);
  Future<Either<AuthFailure, void>> loginWithGoogle();
}
