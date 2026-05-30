class InvalidFieldException implements Exception {
  final String field;
  final String message;

  const InvalidFieldException({required this.field, required this.message});

  @override
  String toString() => message;
}

class UnauthorizedException implements Exception {
  final String message;

  const UnauthorizedException({this.message = 'Não autorizado'});

  @override
  String toString() => message;
}

class ServerException implements Exception {
  final String message;

  const ServerException({this.message = 'Erro no servidor'});

  @override
  String toString() => message;
}

class UnexpectedException implements Exception {
  final String message;

  const UnexpectedException({this.message = 'Erro inesperado'});

  @override
  String toString() => message;
}
