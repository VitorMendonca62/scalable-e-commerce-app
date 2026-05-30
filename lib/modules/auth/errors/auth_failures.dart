sealed class AuthFailure {
  final String message;

  AuthFailure({required this.message});
}

class InvalidFieldFailure extends AuthFailure {
  final String field;

  InvalidFieldFailure({required this.field, required super.message});
}

class UnauthorizedFailure extends AuthFailure {
  UnauthorizedFailure({required super.message});
}

class ServerFailure extends AuthFailure {
  ServerFailure({required super.message});
}

class UnexpectedFailure extends AuthFailure {
  UnexpectedFailure({required super.message});
}
