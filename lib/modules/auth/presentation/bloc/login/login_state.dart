part of 'login_bloc.dart';

abstract class LoginState {
  LoginState();
}

class LoginInitialState extends LoginState {
  LoginInitialState() : super();
}

class LoginLoadingState extends LoginState {
  LoginLoadingState() : super();
}

class LoginSuccessState extends LoginState {
  LoginSuccessState() : super();
}

class LoginFailureFieldState extends LoginState {
  final String exception;
  final String field;

  LoginFailureFieldState({required this.exception, required this.field})
    : super();
}

class LoginFailureState extends LoginState {
  final String exception;

  LoginFailureState({required this.exception}) : super();
}
