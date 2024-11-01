import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<AppEvent, AppState> {
  LoginBloc() : super(InitialState()) {
    on<LoginEvent>(Login);
  }

  void Login(LoginEvent event, Emitter emit) async {
    if (event.username.isEmpty || event.password.isEmpty) {
      emit(FailureState());
      return;
    }

    emit(LoadingState());
    try {
      await _loginRequest(event.username, event.password);
      emit(SuccessState(data: "login Success"));
    } catch (e) {
      emit(FailureState(error: e.toString()));
    }
  }

  Future<void> _loginRequest(String username, String password) async {
    await Future.delayed(Duration(seconds: 5));
  }
}

