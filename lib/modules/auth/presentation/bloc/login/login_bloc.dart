import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:scalable_e_commerce_app/modules/auth/domain/usecases/login_user_usecase.dart';
import 'package:scalable_e_commerce_app/modules/auth/errors/auth_failures.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUserUsecase _useCase;

  LoginBloc(this._useCase) : super(LoginInitialState()) {
    on<LoginRequested>(_onLoginRequested);
    on<LoginWithGoogleRequested>(_onLoginWithGoogleRequested);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoadingState());

    final result = await _useCase.executeDefault(
      email: event.email,
      password: event.password,
    );

    result.match(
      (failure) {
        switch (failure) {
          case InvalidFieldFailure _:
            emit(
              LoginFailureFieldState(
                exception: failure.message,
                field: failure.field,
              ),
            );
            break;
          default:
            emit(LoginFailureState(exception: failure.message));
        }
      },
      (tokens) {
        emit(LoginSuccessState());
      },
    );
  }

  Future<void> _onLoginWithGoogleRequested(
    LoginWithGoogleRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoadingState());

    final result = await _useCase.executeGoogle();

    result.match(
      (failure) {
        switch (failure) {
          case InvalidFieldFailure _:
            emit(
              LoginFailureFieldState(
                exception: failure.message,
                field: failure.field,
              ),
            );
            break;
          default:
            emit(LoginFailureState(exception: failure.message));
        }
      },
      (tokens) {
        emit(LoginSuccessState());
      },
    );
  }
}
